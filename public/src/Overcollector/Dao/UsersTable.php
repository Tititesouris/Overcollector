<?php
namespace Overcollector\Dao;

use Overcollector\User;

class UsersTable extends Table
{

    private static $instance;

    private $fetchUserByName = "
SELECT id, username, region, token
FROM users
WHERE username = $1
;";

    private $addCosmetic = "
INSERT INTO user_cosmetics (user_id, cosmetic_id)
VALUES ($1, $2)
ON CONFLICT ON CONSTRAINT pk_user_cosmetics
DO NOTHING
RETURNING cosmetic_id;
";

    private $removeCosmetic = "
DELETE FROM user_cosmetics
WHERE user_id = $1 AND cosmetic_id = $2
RETURNING cosmetic_id;
";

    private $removeCosmeticsByUserId = "
DELETE FROM user_cosmetics
WHERE user_id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchUserByName", $this->fetchUserByName);
        pg_prepare($this->handler, "addCosmetic", $this->addCosmetic);
        pg_prepare($this->handler, "removeCosmetic", $this->removeCosmetic);
        pg_prepare($this->handler, "removeCosmeticsByUserId", $this->removeCosmeticsByUserId);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseUser($row)
    {
        return User::createUser(
            intval($row["id"]),
            $row["username"],
            $row["region"],
            $row["token"],
            CosmeticsTable::getInstance()->getOwnedCosmeticsByUserId(intval($row["id"])),
            SettingsTable::getInstance()->getUserSettings(intval($row["id"]))
        );
    }

    public function getUserByName($name)
    {
        $response = pg_execute($this->handler, "fetchUserByName", array($name));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseUser($row);
        }
        return null;
    }

    public function updateUserCosmetic($userId, $cosmetic, $owned)
    {
        if ($owned) {
            $response = pg_execute($this->handler, "addCosmetic", array($userId, $cosmetic));
        } else {
            $response = pg_execute($this->handler, "removeCosmetic", array($userId, $cosmetic));
        }
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return true;
        }
        return false;
    }

    public function updateAllCosmetics($userId, $cosmetics)
    {
        pg_query("BEGIN") or die("Could not start transaction\n");
        $response = pg_execute($this->handler, "removeCosmeticsByUserId", array($userId));
        if ($response === false) {
            pg_query("ROLLBACK") or die("Transaction rollback failed\n");
            return false;
        }
        $inserted = 0;
        foreach ($cosmetics as $cosmetic) {
            $response = pg_execute($this->handler, "addCosmetic", array($userId, $cosmetic));
            if ($response === false || ($row = pg_fetch_assoc($response)) === false) {
                pg_query("ROLLBACK") or die("Transaction rollback failed\n");
                return false;
            }
            $inserted++;
        }
        if ($inserted != count($cosmetics)) {
            pg_query("ROLLBACK") or die("Transaction rollback failed\n");
        }
        pg_query("COMMIT") or die("Transaction commit failed\n");
        return true;
    }

}
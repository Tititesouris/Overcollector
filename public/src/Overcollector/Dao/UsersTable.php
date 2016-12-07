<?php
namespace Overcollector\Dao;

use Overcollector\User;

class UsersTable extends Table
{

    private static $instance;

    private $addOrFetchUserByBattleid = "
INSERT INTO users (battleid, battletag)
VALUES ($1, $2)
ON CONFLICT ON CONSTRAINT unique_battleid
DO UPDATE SET battletag = EXCLUDED.battletag
RETURNING id, battleid, battletag;
";

    private $removeCosmeticsByUserId = "
DELETE FROM user_cosmetics
WHERE user_id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "addOrFetchUserByBattleid", $this->addOrFetchUserByBattleid);
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
            $row["battleid"],
            $row["battletag"],
            CosmeticsTable::getInstance()->getOwnedCosmeticsByUserId(intval($row["id"])),
            SettingsTable::getInstance()->getUserSettings(intval($row["id"]))
        );
    }

    public function getUserByBattleid($battleid, $battletag)
    {
        $response = pg_execute($this->handler, "addOrFetchUserByBattleid", array($battleid, $battletag));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseUser($row);
        }
        return null;
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
        foreach ($cosmetics as $cosmeticId) {
            $response = pg_execute($this->handler, "addCosmetic", array($userId, $cosmeticId));
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
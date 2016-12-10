<?php

namespace Overcollector\Dao;


class UserCosmeticsTable extends Table
{

    private static $instance;

    private $fetchUserCosmeticsByUserId = "
SELECT cosmetic_id AS id
FROM user_cosmetics
WHERE user_id = $1
UNION
SELECT id AS id
FROM cosmetics
WHERE category_id IS NULL;
";

    private $addUserCosmetic = "
INSERT INTO user_cosmetics (user_id, cosmetic_id)
SELECT $1, id
FROM cosmetics
WHERE id = $2 AND category_id IS NOT NULL
ON CONFLICT ON CONSTRAINT pk_user_cosmetics
DO NOTHING;
";

    private $removeUserCosmetic = "
DELETE FROM user_cosmetics
WHERE user_id = $1 AND cosmetic_id = $2;
";

    private $removeCosmeticsByUserId = "
DELETE FROM user_cosmetics
WHERE user_id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchUserCosmeticsByUserId", $this->fetchUserCosmeticsByUserId);
        pg_prepare($this->handler, "addUserCosmetic", $this->addUserCosmetic);
        pg_prepare($this->handler, "removeUserCosmetic", $this->removeUserCosmetic);
        pg_prepare($this->handler, "removeCosmeticsByUserId", $this->removeCosmeticsByUserId);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getUserCosmeticsByUserId($userId)
    {
        $response = pg_execute($this->handler, "fetchUserCosmeticsByUserId", [$userId]);
        if ($response !== false) {
            $userCosmetics = [];
            while (($userCosmetic = pg_fetch_assoc($response)) !== false) {
                $userCosmetics[] = $userCosmetic;
            }
            return $userCosmetics;
        }
        return null;
    }

    public function addUserCosmetic($userId, $cosmeticId)
    {
        $response = pg_execute($this->handler, "addUserCosmetic", [$userId, $cosmeticId]);
        if ($response !== false) {
            return true;
        }
        return null;
    }

    public function removeUserCosmetic($userId, $cosmeticId)
    {
        $response = pg_execute($this->handler, "removeUserCosmetic", [$userId, $cosmeticId]);
        if ($response !== false) {
            return true;
        }
        return null;
    }

    public function setUserCosmetics($userId, $cosmetics)
    {
        pg_query("BEGIN") or die("Could not start transaction\n");
        $response = pg_execute($this->handler, "removeCosmeticsByUserId", [$userId]);
        if ($response === false) {
            pg_query("ROLLBACK") or die("Transaction rollback failed\n");
            return false;
        }
        $inserted = 0;
        foreach ($cosmetics as $cosmeticId) {
            $response = pg_execute($this->handler, "addUserCosmetic", [$userId, $cosmeticId]);
            if ($response === false) {
                pg_query("ROLLBACK") or die("Transaction rollback failed\n");
                return false;
            }
            $inserted++;
        }
        if ($inserted != count($cosmetics)) {
            pg_query("ROLLBACK") or die("Transaction rollback failed\n");
            return false;
        }
        pg_query("COMMIT") or die("Transaction commit failed\n");
        return true;
    }

}
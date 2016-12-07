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

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "addOrFetchUserByBattleid", $this->addOrFetchUserByBattleid);
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

}
<?php
namespace Overcollector\Dao;

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

    public function getUserByBattleid($battleid, $battletag)
    {
        $response = pg_execute($this->handler, "addOrFetchUserByBattleid", [$battleid, $battletag]);
        if ($response !== false && ($user = pg_fetch_assoc($response)) !== false) {
            return $user;
        }
        return null;
    }

}
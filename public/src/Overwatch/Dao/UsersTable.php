<?php
namespace Overwatch\Dao;

use Overwatch\User;

require_once(__DIR__ . "/Database.php");

class UsersTable
{

    private static $instance;

    private $handler;

    private $fetchUserByName = "SELECT id, username FROM users WHERE username = $1;";

    private $addCosmetic = "INSERT INTO user_cosmetics (user_id, cosmetic_id) VALUES ($1, $2) RETURNING cosmetic_id;";

    private $removeCosmeticsByUserId = "DELETE FROM user_cosmetics WHERE user_id = $1;";

    private function __construct()
    {
        $this->handler = Database::getInstance()->getHandler();
        pg_prepare($this->handler, "fetchUserByName", $this->fetchUserByName);
        pg_prepare($this->handler, "addCosmetic", $this->addCosmetic);
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
        return new User(
            intval($row["id"]),
            $row["username"]
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

    public function updateCosmetics($userId, $cosmetics)
    {
        pg_query("BEGIN") or die("Could not start transaction\n");
        $response = pg_execute($this->handler, "removeCosmeticsByUserId", array($userId));
        if ($response === false) {
            pg_query("ROLLBACK") or die("Transaction rollback failed\n");
            return false;
        }

        foreach ($cosmetics as $cosmetic) {
            $response = pg_execute($this->handler, "addCosmetic", array($userId, $cosmetic));
            if ($response === false || ($row = pg_fetch_assoc($response)) === false) {
                pg_query("ROLLBACK") or die("Transaction rollback failed\n");
                return false;
            }
        }

        pg_query("COMMIT") or die("Transaction commit failed\n");
        return true;
    }

}
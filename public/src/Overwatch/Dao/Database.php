<?php
namespace Overwatch\Dao;

class Database
{

    private static $instance = null;

    private static $user = "overwatch";

    private static $password = "localpass";

    private static $host = "localhost";

    private static $database = "overwatch";

    private $handler;

    private function __construct($user, $password, $host, $database)
    {
        $this->handler = pg_connect("host=$host port=5432 dbname=$database user=$user password=$password");
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self(self::$user, self::$password, self::$host, self::$database);
        }
        return self::$instance;
    }

    public function getHandler()
    {
        return $this->handler;
    }

    public function __destruct()
    {
        $this->handler = null;
    }
}
<?php
namespace Overcollector\Dao;

class Database
{

    private static $instance = null;

    private $handler;

    private function __construct($host, $port, $database, $user, $password)
    {
        $this->handler = pg_connect("host=$host port=$port dbname=$database user=$user password=$password");
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            $config = parse_ini_file(__DIR__ . "/../../../../overcollector.ini", true);
            $database = $config["database"];
            self::$instance = new self($database["host"], $database["port"], $database["database"], $database["user"], $database["password"]);
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
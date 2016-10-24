<?php

namespace Overwatch\Dao;

use Overwatch\Type;

class TypesTable
{

    private static $instance;

    private $handler;

    private $fetchAllTypes = "SELECT id, name FROM types;";

    private $fetchTypeById = "SELECT id, name FROM types WHERE id = $1;";

    private function __construct()
    {
        $this->handler = Database::getInstance()->getHandler();
        pg_prepare($this->handler, "fetchAllTypes", $this->fetchAllTypes);
        pg_prepare($this->handler, "fetchTypeById", $this->fetchTypeById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseType($row)
    {
        return Type::createType(
            intval($row["id"]),
            $row["name"]
        );
    }

    public function getTypeById($id) {
        $response = pg_execute($this->handler, "fetchTypeById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseType($row);
        }
        return null;
    }
}
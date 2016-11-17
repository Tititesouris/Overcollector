<?php

namespace Overcollector\Dao;

use Overcollector\Type;

class TypesTable extends Table
{

    private static $instance;

    private $fetchAllTypes = "
SELECT id, name, slug
FROM types
ORDER BY id;
";

    private $fetchTypeById = "
SELECT id, name, slug
FROM types
WHERE id = $1;
";

    protected function __construct()
    {
        parent::__construct();
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
            $row["name"],
            $row["slug"]
        );
    }

    public function getAllTypes()
    {
        $response = pg_execute($this->handler, "fetchAllTypes", array());
        if ($response !== false) {
            $types = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $types[] = $this->parseType($row);
            }
            return $types;
        }
        return [];
    }

    public function getAllTypesSortById()
    {
        $response = pg_execute($this->handler, "fetchAllTypes", array());
        if ($response !== false) {
            $types = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $type = $this->parseType($row);
                $types[$type->getId()] = $type;
            }
            return $types;
        }
        return [];
    }

    public function getTypeById($id)
    {
        $response = pg_execute($this->handler, "fetchTypeById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseType($row);
        }
        return null;
    }

}
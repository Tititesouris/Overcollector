<?php

namespace Overcollector\Dao;


class TypesTable extends Table
{

    private static $instance;

    private $fetchTypes = "
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
        pg_prepare($this->handler, "fetchTypes", $this->fetchTypes);
        pg_prepare($this->handler, "fetchTypeById", $this->fetchTypeById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getTypes()
    {
        $response = pg_execute($this->handler, "fetchTypes", []);
        if ($response !== false) {
            $types = [];
            while (($type = pg_fetch_assoc($response)) !== false) {
                $types[] = $type;
            }
            return $types;
        }
        return null;
    }

    public function getTypeById($id)
    {
        $response = pg_execute($this->handler, "fetchTypeById", [$id]);
        if ($response !== false && ($type = pg_fetch_assoc($response)) !== false) {
            return $type;
        }
        return null;
    }

}
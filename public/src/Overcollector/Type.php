<?php

namespace Overcollector;

use JsonSerializable;

class Type implements JsonSerializable
{

    private static $types = array();

    private $id;

    private $name;

    private function __construct($id, $name)
    {
        $this->id = $id;
        $this->name = $name;
    }

    public static function createType($id, $name)
    {
        if (!array_key_exists($id, self::$types)) {
            self::$types[$id] = new Type($id, $name);
        }
        return self::$types[$id];
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name
        ];
    }

}
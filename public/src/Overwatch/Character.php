<?php

namespace Overwatch;

use JsonSerializable;


class Character implements JsonSerializable
{
    private static $characters = array();

    private $id;

    private $name;

    private function __construct($id, $name)
    {
        $this->id = $id;
        $this->name = $name;
    }

    public static function createCharacter($id, $name)
    {
        if (!array_key_exists($id, self::$characters)) {
            self::$characters[$id] = new Character($id, $name);
        }
        return self::$characters[$id];
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
        ];
    }
}
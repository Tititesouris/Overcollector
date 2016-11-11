<?php

namespace Overwatch;

use JsonSerializable;


class Hero implements JsonSerializable
{
    private static $heroes = array();

    private $id;

    private $name;

    private $short;

    private function __construct($id, $name, $short)
    {
        $this->id = $id;
        $this->name = $name;
        $this->short = $short;
    }

    public static function createHero($id, $name, $short)
    {
        if (!array_key_exists($id, self::$heroes)) {
            self::$heroes[$id] = new Hero($id, $name, $short);
        }
        return self::$heroes[$id];
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

    /**
     * @return mixed
     */
    public function getShort()
    {
        return $this->short;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "short" => $this->short
        ];
    }
}
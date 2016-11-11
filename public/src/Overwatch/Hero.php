<?php

namespace Overwatch;

use JsonSerializable;


class Hero implements JsonSerializable
{
    private static $heroes = array();

    private $id;

    private $name;

    private $slug;

    private function __construct($id, $name, $slug)
    {
        $this->id = $id;
        $this->name = $name;
        $this->slug = $slug;
    }

    public static function createHero($id, $name, $slug)
    {
        if (!array_key_exists($id, self::$heroes)) {
            self::$heroes[$id] = new Hero($id, $name, $slug);
        }
        return self::$heroes[$id];
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }


    public function getSlug()
    {
        return $this->slug;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "slug" => $this->slug
        ];
    }
}
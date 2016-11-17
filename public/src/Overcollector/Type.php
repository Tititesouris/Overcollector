<?php

namespace Overcollector;

use JsonSerializable;

class Type implements JsonSerializable
{

    private static $types = array();

    private $id;

    private $name;

    private $slug;

    private function __construct($id, $name, $slug)
    {
        $this->id = $id;
        $this->name = $name;
        $this->slug = $slug;
    }

    public static function createType($id, $name, $slug)
    {
        if (!array_key_exists($id, self::$types)) {
            self::$types[$id] = new Type($id, $name, $slug);
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
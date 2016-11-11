<?php
namespace Overwatch;


use JsonSerializable;

class Category implements JsonSerializable
{

    private static $categories = array();

    private $id;

    private $name;

    private $description;

    private $short;

    private function __construct($id, $name, $description, $short)
    {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->short = $short;
    }

    public static function createCategory($id, $name, $description, $short)
    {
        if (!array_key_exists($id, self::$categories)) {
            self::$categories[$id] = new Category($id, $name, $description, $short);
        }
        return self::$categories[$id];
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function getShort()
    {
        return $this->short;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "description" => $this->description,
            "short" => $this->short
        ];
    }

}
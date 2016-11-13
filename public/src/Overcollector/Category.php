<?php
namespace Overcollector;


use JsonSerializable;

class Category implements JsonSerializable
{

    private static $categories = array();

    private $id;

    private $name;

    private $description;

    private $slug;

    private function __construct($id, $name, $description, $slug)
    {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->slug = $slug;
    }

    public static function createCategory($id, $name, $description, $slug)
    {
        if (!array_key_exists($id, self::$categories)) {
            self::$categories[$id] = new Category($id, $name, $description, $slug);
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

    public function getSlug()
    {
        return $this->slug;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "description" => $this->description,
            "short" => $this->slug
        ];
    }

}
<?php
namespace Overwatch;

use JsonSerializable;

class Cosmetic implements JsonSerializable
{

    private static $cosmetics = array();

    private $id;

    private $category;

    private $type;

    private $rarity;

    private $hero;

    private $name;

    private $event;

    private function __construct($id, $category, $type, $rarity, $hero, $name, $event)
    {
        $this->id = $id;
        $this->category = $category;
        $this->type = $type;
        $this->rarity = $rarity;
        $this->hero = $hero;
        $this->name = $name;
        $this->event = $event;
    }

    public static function createCosmetic($id, $category, $type, $rarity, $hero, $name, $event)
    {
        if (!array_key_exists($id, self::$cosmetics)) {
            self::$cosmetics[$id] = new Cosmetic($id, $category, $type, $rarity, $hero, $name, $event);
        }
        return self::$cosmetics[$id];
    }

    public function getId()
    {
        return $this->id;
    }

    public function getCategory()
    {
        return $this->category;
    }

    public function getType()
    {
        return $this->type;
    }

    public function getRarity()
    {
        return $this->rarity;
    }

    public function getHero()
    {
        return $this->hero;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getEvent()
    {
        return $this->event;
    }

    function jsonSerialize()
    {
        return [
            "todo" => "todo"
        ];
    }
}
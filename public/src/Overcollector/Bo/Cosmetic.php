<?php
namespace Overcollector\Bo;

use JsonSerializable;

class Cosmetic implements JsonSerializable
{

    private $id;

    private $category;

    private $type;

    private $rarity;

    private $hero;

    private $name;

    private $event;

    public function __construct($id, $category, $type, $rarity, $hero, $name, $event)
    {
        $this->id = $id;
        $this->category = $category;
        $this->type = $type;
        $this->rarity = $rarity;
        $this->hero = $hero;
        $this->name = $name;
        $this->event = $event;
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

    public function getPrice() {
        return $this->rarity->getBasePrice() && $this->category->getPriceMultiplier();
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "category" => $this->category,
            "type" => $this->type,
            "rarity" => $this->rarity,
            "hero" => $this->hero,
            "name" => $this->name,
            "event" => $this->event
        ];
    }
}
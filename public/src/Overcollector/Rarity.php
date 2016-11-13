<?php

namespace Overcollector;

use JsonSerializable;

class Rarity implements JsonSerializable
{

    private static $rarities = array();

    private $id;

    private $name;

    private $basePrice;

    private function __construct($id, $name, $basePrice)
    {
        $this->id = $id;
        $this->name = $name;
        $this->basePrice = $basePrice;
    }

    public static function createRarity($id, $name, $basePrice)
    {
        if (!array_key_exists($id, self::$rarities)) {
            self::$rarities[$id] = new Rarity($id, $name, $basePrice);
        }
        return self::$rarities[$id];
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getBasePrice()
    {
        return $this->basePrice;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "base_price" => $this->basePrice
        ];
    }
}
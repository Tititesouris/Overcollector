<?php

namespace Overwatch;

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
    public function getBasePrice()
    {
        return $this->basePrice;
    }

    /**
     * Specify data which should be serialized to JSON
     * @link http://php.net/manual/en/jsonserializable.jsonserialize.php
     * @return mixed data which can be serialized by <b>json_encode</b>,
     * which is a value of any type other than a resource.
     * @since 5.4.0
     */
    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "base_price" => $this->basePrice
        ];
    }
}
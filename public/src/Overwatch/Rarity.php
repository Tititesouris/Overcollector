<?php

namespace Overwatch;


class Rarity
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

}
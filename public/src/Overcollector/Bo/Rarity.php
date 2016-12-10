<?php

namespace Overcollector\Bo;

use JsonSerializable;

class Rarity implements JsonSerializable
{

    private $id;

    private $name;

    private $basePrice;

    public function __construct($id, $name, $basePrice)
    {
        $this->id = $id;
        $this->name = $name;
        $this->basePrice = $basePrice;
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
<?php
namespace Overcollector\Bo;


use JsonSerializable;

class Category implements JsonSerializable
{

    private $id;

    private $name;

    private $description;

    private $priceMultiplier;

    private $slug;

    public function __construct($id, $name, $description, $priceMultiplier, $slug)
    {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->priceMultiplier = $priceMultiplier;
        $this->slug = $slug;
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

    public function getPriceMultiplier()
    {
        return $this->priceMultiplier;
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
            "price_multiplier" => $this->priceMultiplier,
            "slug" => $this->slug
        ];
    }

}
<?php

namespace Overcollector\Bo;

use JsonSerializable;

class Setting implements JsonSerializable
{

    private $id;

    private $name;

    private $description;

    private $type;

    private $default;

    private $min;

    private $max;

    public function __construct($id, $name, $description, $type, $default, $min, $max)
    {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->type = $type;
        $this->default = $default;
        $this->min = $min;
        $this->max = $max;
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

    public function getType()
    {
        return $this->type;
    }

    public function getDefault()
    {
        return $this->default;
    }

    public function getMin()
    {
        return $this->min;
    }

    public function getMax()
    {
        return $this->max;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "description" => $this->description,
            "type" => $this->type,
            "default" => $this->default,
            "min" => $this->min,
            "max" => $this->max
        ];
    }

}
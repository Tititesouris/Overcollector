<?php

namespace Overcollector;

use JsonSerializable;

class Setting implements JsonSerializable
{

    private $id;

    private $name;

    private $description;

    private $default;

    private $min;

    private $max;

    public function __construct($id, $name, $description, $default, $min, $max)
    {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->default = $default;
        $this->min = $min;
        $this->max = $max;
    }

    public static function createSetting($id, $name, $description, $default, $min, $max)
    {
        return new self($id, $name, $description, self::parseValue($default), self::parseValue($min), self::parseValue($max));
    }

    private static function parseValue($value)
    {
        if ($value === "true")
            return true;
        if ($value === "false")
            return false;
        return intval($value);
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
            "dedault" => $this->default,
            "min" => $this->min,
            "max" => $this->max
        ];
    }

}
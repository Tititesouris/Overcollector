<?php

namespace Overcollector;

use JsonSerializable;

class UserSetting implements JsonSerializable
{

    private $id;

    private $name;

    private $description;

    private $value;

    private function __construct($id, $name, $description, $value)
    {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->value = $value;
    }

    public static function createUserSetting($id, $name, $description, $value)
    {
        return new self($id, $name, $description, self::parseValue($value));
    }

    private static function parseValue($value)
    {
        if ($value === "true")
            return true;
        if ($value === "false")
            return false;
        return null;
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

    public function getValue()
    {
        return $this->value;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "description" => $this->description,
            "value" => $this->value
        ];
    }

}
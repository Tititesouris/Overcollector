<?php

namespace Overcollector\Bo;

use JsonSerializable;

class UserSetting implements JsonSerializable
{

    private $settingId;

    private $name;

    private $description;

    private $value;

    public function __construct($settingId, $name, $description, $value)
    {
        $this->settingId = $settingId;
        $this->name = $name;
        $this->description = $description;
        $this->value = $value;
    }

    public function getSettingId()
    {
        return $this->settingId;
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
            "setting_id" => $this->settingId,
            "name" => $this->name,
            "description" => $this->description,
            "value" => $this->value
        ];
    }

}
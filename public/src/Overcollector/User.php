<?php
namespace Overcollector;

use JsonSerializable;

class User implements JsonSerializable
{
    private $id;

    private $username;

    private $region;

    private $token;

    private $cosmetics;

    private $settings;

    public function __construct($id, $username, $region, $token, $cosmetics, $settings)
    {
        $this->id = $id;
        $this->username = $username;
        $this->region = $region;
        $this->token = $token;
        $this->cosmetics = $cosmetics;
        $this->settings = $settings;
    }

    public static function createUser($id, $username, $region, $token, $cosmetics, $settings)
    {
        return new self($id, $username, $region, $token, $cosmetics, $settings);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getUsername()
    {
        return $this->username;
    }

    public function getRegion()
    {
        return $this->region;
    }

    public function getToken()
    {
        return $this->token;
    }

    public function getCosmetics($heroId)
    {
        $cosmetics = [];
        foreach ($this->cosmetics as $cosmetic) {
            if (($cosmetic->getHero() === null && $heroId === 0) ||
                ($cosmetic->getHero() !== null && $cosmetic->getHero()->getId() === $heroId)
            ) {
                $cosmetics[] = $cosmetic;
            }
        }
        return $cosmetics;
    }

    public function setCosmetics($cosmetics)
    {
        $this->cosmetics = $cosmetics;
    }

    public function hasCosmetic($id)
    {
        foreach ($this->cosmetics as $cosmetic) {
            if ($cosmetic->getId() === $id)
                return true;
        }
        return false;
    }

    public function getSettings()
    {
        return $this->settings;
    }

    public function setSetting(UserSetting $setting)
    {
        $this->settings[$setting->getName()] = $setting;
    }

    public function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "username" => $this->username,
            "region" => $this->region,
            "token" => $this->token
        ];
    }

}
<?php
namespace Overwatch;

use JsonSerializable;

class User implements JsonSerializable
{
    private $id;

    private $username;

    private $cosmetics;

    private $settings;

    private function __construct($id, $username, $cosmetics, $settings)
    {
        $this->id = $id;
        $this->username = $username;
        $this->cosmetics = $cosmetics;
        $this->settings = $settings;
    }

    public static function createUser($id, $username, $cosmetics, $settings)
    {
        return new self($id, $username, $cosmetics, $settings);
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
    public function getUsername()
    {
        return $this->username;
    }

    public function getCosmetics($heroId) //TODO remove if I manage to do without it
    {
        $cosmetics = [];
        foreach ($this->cosmetics as $cosmetic) {
            if (($cosmetic->getHero() === null && $heroId === 0) ||
                ($cosmetic->getHero() !== null && $cosmetic->getHero()->getId() === $heroId)
            ) {
                $cosmetics[$cosmetic->getType()->getId()][] = $cosmetic;
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
            "username" => $this->username
        ];
    }

}
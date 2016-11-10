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

    public function getCosmetics($characterId)
    {
        $cosmetics = [];
        foreach ($this->cosmetics as $cosmetic) {
            if (($cosmetic->getCharacter() === null && $characterId === 0) ||
                ($cosmetic->getCharacter() !== null && $cosmetic->getCharacter()->getId() === $characterId)
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

    public function setSetting($setting)
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
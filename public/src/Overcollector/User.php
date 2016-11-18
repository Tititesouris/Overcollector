<?php
namespace Overcollector;

use JsonSerializable;

class User implements JsonSerializable
{
    private $id;

    private $battleid;

    private $battletag;

    private $cosmetics;

    private $settings;

    public function __construct($id, $battleid, $battletag, $cosmetics, $settings)
    {
        $this->id = $id;
        $this->battleid = $battleid;
        $this->battletag = $battletag;
        $this->cosmetics = $cosmetics;
        $this->settings = $settings;
    }

    public static function createUser($id, $battleid, $battletag, $cosmetics, $settings)
    {
        return new self($id, $battleid, $battletag, $cosmetics, $settings);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getBattleid()
    {
        return $this->battleid;
    }

    public function getBattletag()
    {
        return $this->battletag;
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
            "battleid" => $this->battleid,
            "battletag" => $this->battletag
        ];
    }

}
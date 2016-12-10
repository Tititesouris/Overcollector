<?php
namespace Overcollector\Bo;

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

    /**
     * Returns every cosmetic owned by the user
     */
    public function getCosmetics()
    {
        return $this->cosmetics;
    }

    /**
     * Returns the cosmetics provided sorted by heroes
     */
    public function sortCosmeticsByHeroes($cosmetics)
    {
        $heroes = [];
        foreach ($cosmetics as $cosmetic) {
            $heroes[$cosmetic->getHero() !== null ? $cosmetic->getHero()->getId() : 0][] = $cosmetic;
        }
        return $heroes;
    }

    /**
     * Returns the cosmetics provided sorted by categories
     */
    public function sortCosmeticsByCategories($cosmetics)
    {
        $categories = [];
        foreach ($cosmetics as $cosmetic) {
            $categories[$cosmetic->getCategory() !== null ? $cosmetic->getCategory()->getId() : 0][$cosmetic->getId()] = $cosmetic;
        }
        return $categories;
    }

    /**
     * Returns the cosmetics provided sorted by types
     */
    public function sortCosmeticsByTypes($cosmetics)
    {
        $types = [];
        foreach ($cosmetics as $cosmetic) {
            $types[$cosmetic->getType()->getId()][$cosmetic->getId()] = $cosmetic;
        }
        return $types;
    }

    /**
     * Returns the cosmetics provided sorted by heroes and types
     */
    public function sortCosmeticsByHeroesAndTypes($cosmetics)
    {
        $heroes = [];
        foreach ($cosmetics as $cosmetic) {
            $heroes[$cosmetic->getHero() !== null ? $cosmetic->getHero()->getId() : "0"][$cosmetic->getType()->getId()][$cosmetic->getId()] = $cosmetic;
        }
        return $heroes;
    }

    /**
     * Filters the list of cosmetics provided and returns every cosmetic matching the user's settings
     */
    public function filterCosmeticsByUserSettings($cosmetics)
    {
        $filtered = [];
        foreach ($cosmetics as $cosmetic) {
            if ($this->settings["collection-show-owned-cosmetics"]->getValue() || !$this->hasCosmetic($cosmetic->getId())) {
                $heroSlug = $cosmetic->getHero() !== null ? $cosmetic->getHero()->getSlug() : "allheroes";
                if ($this->settings["collection-show-hero-" . $heroSlug]->getValue()) {
                    $categorySlug = $cosmetic->getCategory() !== null ? $cosmetic->getCategory()->getSlug() : "default";
                    if ($this->settings["collection-show-category-" . $categorySlug]->getValue()) {
                        $typeSlug = $cosmetic->getType()->getSlug();
                        if ($this->settings["collection-show-type-" . $typeSlug]->getValue()) {
                            $filtered[$cosmetic->getId()] = $cosmetic;
                        }
                    }
                }
            }
        }
        return $filtered;
    }

    public function hasCosmetic($id)
    {
        return isset($this->cosmetics[$id]);
    }

    public function addCosmetic($cosmetic)
    {
        $this->cosmetics[$cosmetic->getId()] = $cosmetic;
    }

    public function removeCosmetic($id)
    {
        unset($this->cosmetics[$id]);
    }

    public function setCosmetics($cosmetics)
    {
        $this->cosmetics = $cosmetics;
    }

    public function getSettings()
    {
        return $this->settings;
    }

    public function addSetting($setting)
    {
        $this->settings[$setting->getName()] = $setting;
    }

    public function setSettings($settings)
    {
        $this->settings = $settings;
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
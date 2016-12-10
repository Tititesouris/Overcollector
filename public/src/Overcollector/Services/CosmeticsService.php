<?php

namespace Overcollector\Services;


use Overcollector\Bo\Cosmetic;
use Overcollector\Dao\CosmeticsTable;

class CosmeticsService
{

    private static $cosmetics = [];

    public static function getCosmeticById($id)
    {
        if (!isset(self::$cosmetics[$id])) {
            $cosmetic = CosmeticsTable::getInstance()->getCosmeticById($id);
            if ($cosmetic === null)
                return null;
            self::$cosmetics[intval($cosmetic["id"])] = new Cosmetic(
                intval($cosmetic["id"]),
                CategoriesService::getCategoryById(intval($cosmetic["category_id"])),
                TypesService::getTypeById(intval($cosmetic["type_id"])),
                RaritiesService::getRarityById(intval($cosmetic["rarity_id"])),
                HeroesService::getHeroById(intval($cosmetic["hero_id"])),
                $cosmetic["name"],
                EventsService::getEventById(intval($cosmetic["event_id"]))
            );
        }
        return self::$cosmetics[$id];
    }

    public static function getCosmetics()
    {
        if (count(self::$cosmetics) === 0) {
            $cosmetics = CosmeticsTable::getInstance()->getCosmetics();
            if ($cosmetics === null)
                return null;
            foreach ($cosmetics as $cosmetic) {
                self::$cosmetics[intval($cosmetic["id"])] = new Cosmetic(
                    intval($cosmetic["id"]),
                    CategoriesService::getCategoryById(intval($cosmetic["category_id"])),
                    TypesService::getTypeById(intval($cosmetic["type_id"])),
                    RaritiesService::getRarityById(intval($cosmetic["rarity_id"])),
                    HeroesService::getHeroById(intval($cosmetic["hero_id"])),
                    $cosmetic["name"],
                    EventsService::getEventById(intval($cosmetic["event_id"]))
                );
            }
        }
        return self::$cosmetics;
    }


}
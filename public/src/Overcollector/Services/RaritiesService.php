<?php

namespace Overcollector\Services;


use Overcollector\Bo\Rarity;
use Overcollector\Dao\RaritiesTable;

class RaritiesService
{

    private static $rarities = [];

    public static function getRarityById($id)
    {
        if (!isset(self::$rarities[$id])) {
            $rarity = RaritiesTable::getInstance()->getRarityById($id);
            if ($rarity === null)
                return null;
            self::$rarities[intval($rarity["id"])] = new Rarity(
                intval($rarity["id"]),
                $rarity["name"],
                intval($rarity["base_price"])
            );
        }
        return self::$rarities[$id];
    }

    public static function getRarities()
    {
        if (count(self::$rarities) === 0) {
            $rarities = RaritiesTable::getInstance()->getRarities();
            if ($rarities === null)
                return null;
            foreach ($rarities as $rarity) {
                self::$rarities[intval($rarity["id"])] = new Rarity(
                    intval($rarity["id"]),
                    $rarity["name"],
                    intval($rarity["base_price"])
                );
            }
        }
        return self::$rarities;
    }

}
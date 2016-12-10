<?php

namespace Overcollector\Services;


use Overcollector\Bo\Hero;
use Overcollector\Dao\HeroesTable;

class HeroesService
{
    private static $heroes = [];

    public static function getHeroById($id)
    {
        if (!isset(self::$heroes[$id])) {
            $hero = HeroesTable::getInstance()->getHeroById($id);
            if ($hero === null)
                return null;
            self::$heroes[intval($hero["id"])] = new Hero(
                intval($hero["id"]),
                $hero["name"],
                $hero["slug"]
            );
        }
        return self::$heroes[$id];
    }

    public static function getHeroes()
    {
        if (count(self::$heroes) === 0) {
            $heroes = HeroesTable::getInstance()->getHeroes();
            if ($heroes === null)
                return null;
            foreach ($heroes as $hero) {
                self::$heroes[intval($hero["id"])] = new Hero(
                    intval($hero["id"]),
                    $hero["name"],
                    $hero["slug"]
                );
            }
        }
        return self::$heroes;
    }


}
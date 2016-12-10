<?php

namespace Overcollector\Services;


use Overcollector\Bo\Category;
use Overcollector\Dao\CategoriesTable;

class CategoriesService
{

    private static $categories = [];

    public static function getCategoryById($id)
    {
        if (!isset(self::$categories[$id])) {
            $category = CategoriesTable::getInstance()->getCategoryById($id);
            if ($category === null)
                return null;
            self::$categories[intval($category["id"])] = new Category(
                intval($category["id"]),
                $category["name"],
                $category["description"],
                floatval($category["price_multiplier"]),
                $category["slug"]
            );
        }
        return self::$categories[$id];
    }

    public static function getCategories()
    {
        if (count(self::$categories) === 0) {
            $categories = CategoriesTable::getInstance()->getCategories();
            if ($categories === null)
                return null;
            foreach ($categories as $category) {
                self::$categories[intval($category["id"])] = new Category(
                    intval($category["id"]),
                    $category["name"],
                    $category["description"],
                    floatval($category["price_multiplier"]),
                    $category["slug"]
                );
            }
        }
        return self::$categories;
    }

}
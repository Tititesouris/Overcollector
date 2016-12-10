<?php

namespace Overcollector\Services;


use Overcollector\Bo\Type;
use Overcollector\Dao\TypesTable;

class TypesService
{

    private static $types = [];

    public static function getTypeById($id)
    {
        if (!isset(self::$types[$id])) {
            $type = TypesTable::getInstance()->getTypeById($id);
            if ($type === null)
                return null;
            self::$types[intval($type["id"])] = new Type(
                intval($type["id"]),
                $type["name"],
                $type["slug"]
            );
        }
        return self::$types[$id];
    }

    public static function getTypes()
    {
        if (count(self::$types) === 0) {
            $types = TypesTable::getInstance()->getTypes();
            if ($types === null)
                return null;
            foreach ($types as $type) {
                self::$types[intval($type["id"])] = new Type(
                    intval($type["id"]),
                    $type["name"],
                    $type["slug"]
                );
            }
        }
        return self::$types;
    }

}
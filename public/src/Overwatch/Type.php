<?php

namespace Overwatch;


class Type
{

    private static $types = array();

    private $id;

    private $name;

    private function __construct($id, $name)
    {
        $this->id = $id;
        $this->name = $name;
    }

    public static function createType($id, $name)
    {
        if (!array_key_exists($id, self::$types)) {
            self::$types[$id] = new Type($id, $name);
        }
        return self::$types[$id];
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
    public function getName()
    {
        return $this->name;
    }

}
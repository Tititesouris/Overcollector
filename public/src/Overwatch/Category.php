<?php
namespace Overwatch;


use JsonSerializable;

class Category
{

    private static $categories = array();

    private $id;

    private $name;

    private $description;

    private function __construct($id, $name, $description)
    {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
    }

    public static function createCategory($id, $name, $description)
    {
        if (!array_key_exists($id, self::$categories)) {
            self::$categories[$id] = new Category($id, $name, $description);
        }
        return self::$categories[$id];
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

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

}
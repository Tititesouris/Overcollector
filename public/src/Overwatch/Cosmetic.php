<?php
namespace Overwatch;

use JsonSerializable;

class Cosmetic implements JsonSerializable
{

    private static $cosmetics = array();

    private $id;

    private $category;

    private $type;

    private $rarity;

    private $character;

    private $name;

    private function __construct($id, $category, $type, $rarity, $character, $name)
    {
        $this->id = $id;
        $this->category = $category;
        $this->type = $type;
        $this->rarity = $rarity;
        $this->character = $character;
        $this->name = $name;
    }

    public static function createCosmetic($id, $category, $type, $rarity, $character, $name)
    {
        if (!array_key_exists($id, self::$cosmetics)) {
            self::$cosmetics[$id] = new Cosmetic($id, $category, $type, $rarity, $character, $name);
        }
        return self::$cosmetics[$id];
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
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @return mixed
     */
    public function getRarity()
    {
        return $this->rarity;
    }

    /**
     * @return mixed
     */
    public function getCharacter()
    {
        return $this->character;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    function jsonSerialize()
    {
        return [
            "todo" => "todo"
        ];
    }
}
<?php

namespace Overwatch\Dao;

use Overwatch\Category;
use Overwatch\Cosmetic;

require_once(__DIR__ . "/Database.php");

class CosmeticsTable
{

    private static $instance;

    private $handler;

    private $fetchAllCosmetics = "SELECT id, category_id, type_id, rarity_id, character_id, name FROM cosmetics ORDER BY character_id, type_id, name, category_id, rarity_id;";

    private $fetchCosmeticsIdByUserId = "SELECT id, category_id, type_id, rarity_id, character_id, name FROM cosmetics LEFT JOIN user_cosmetics ON cosmetics.id = cosmetic_id WHERE user_id = $1 OR cosmetics.category_id IS NULL ORDER BY character_id, type_id, name, category_id, rarity_id;";

    private function __construct()
    {
        $this->handler = Database::getInstance()->getHandler();
        pg_prepare($this->handler, "fetchAllCosmetics", $this->fetchAllCosmetics);
        pg_prepare($this->handler, "fetchCosmeticsIdByUserId", $this->fetchCosmeticsIdByUserId);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseCosmetic($row)
    {
        return Cosmetic::createCosmetic(
            intval($row["id"]),
            CategoriesTable::getInstance()->getCategoryById(intval($row["category_id"])),
            TypesTable::getInstance()->getTypeById(intval($row["type_id"])),
            RaritiesTable::getInstance()->getRarityById(intval($row["rarity_id"])),
            CharactersTable::getInstance()->getCharacterById(intval($row["character_id"])),
            $row["name"]
        );
    }

    public function getAllCosmetics()
    {
        $response = pg_execute($this->handler, "fetchAllCosmetics", array());
        if ($response !== false) {
            $cosmetics = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $cosmetics[] = $this->parseCosmetic($row);
            }
            return $cosmetics;
        }
        return [];
    }

    public function getCosmeticsByUserId($userId)
    {
        $response = pg_execute($this->handler, "fetchCosmeticsIdByUserId", array($userId));
        if ($response !== false) {
            $cosmetics = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $cosmetics[] = $this->parseCosmetic($row);
            }
            return $cosmetics;
        }
        return [];
    }
}
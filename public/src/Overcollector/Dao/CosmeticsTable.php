<?php

namespace Overcollector\Dao;

use Overcollector\Cosmetic;

class CosmeticsTable extends Table
{

    private static $instance;

    private $fetchCosmetics = "
SELECT cosmetics.id, cosmetics.category_id, type_id, rarity_id, hero_id, cosmetics.name, event_id
FROM cosmetics
LEFT JOIN heroes
  ON cosmetics.hero_id = heroes.id
LEFT JOIN
  (VALUES (1, 1), (2, 2), (5, 3), (6, 4), (7, 5), (9, 6), (3, 7), (4, 8), (8, 9)) AS orders(category_id, ordering)
    ON cosmetics.category_id = orders.category_id
ORDER BY heroes.name IS NULL DESC, heroes.name ASC, type_id, rarity_id, ordering, cosmetics.name, event_id;
";

    private $fetchCosmeticById = "
SELECT id, category_id, type_id, rarity_id, hero_id, name, event_id
FROM cosmetics
WHERE id = $1;
";

    private $fetchOwnedCosmeticsByUserId = "
SELECT cosmetics.id, cosmetics.category_id, type_id, rarity_id, hero_id, cosmetics.name, event_id
FROM cosmetics
  LEFT JOIN user_cosmetics
    ON cosmetics.id = user_cosmetics.cosmetic_id OR cosmetics.category_id IS NULL
  LEFT JOIN heroes
    ON cosmetics.hero_id = heroes.id
  LEFT JOIN
  (VALUES (1, 1), (2, 2), (5, 3), (6, 4), (7, 5), (9, 6), (3, 7), (4, 8), (8, 9)) AS orders(category_id, ordering)
    ON cosmetics.category_id = orders.category_id
WHERE user_id = $1 OR cosmetics.category_id IS NULL
ORDER BY heroes.name IS NULL DESC, heroes.name ASC, type_id, rarity_id, ordering, cosmetics.name, event_id;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchCosmetics", $this->fetchCosmetics);
        pg_prepare($this->handler, "fetchCosmeticById", $this->fetchCosmeticById);
        pg_prepare($this->handler, "fetchOwnedCosmeticsByUserId", $this->fetchOwnedCosmeticsByUserId);
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
            HeroesTable::getInstance()->getHeroById(intval($row["hero_id"])),
            $row["name"],
            EventsTable::getInstance()->getEventById(intval($row["event_id"]))
        );
    }

    public function getCosmetics()
    {
        $response = pg_execute($this->handler, "fetchCosmetics", array());
        if ($response !== false) {
            $cosmetics = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $cosmetics[] = $this->parseCosmetic($row);
            }
            return $cosmetics;
        }
        return [];
    }

    public function getCosmeticById($id)
    {
        $response = pg_execute($this->handler, "fetchCosmeticById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return self::parseCosmetic($row);
        }
        return null;
    }

    public function getOwnedCosmeticsByUserId($userId)
    {
        $response = pg_execute($this->handler, "fetchOwnedCosmeticsByUserId", array($userId));
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
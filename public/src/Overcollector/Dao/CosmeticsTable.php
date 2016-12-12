<?php

namespace Overcollector\Dao;

class CosmeticsTable extends Table
{

    private static $instance;

    private $fetchCosmetics = "
SELECT cosmetics.id, cosmetics.category_id, type_id, rarity_id, hero_id, cosmetics.name, event_id
FROM cosmetics
LEFT JOIN heroes
  ON cosmetics.hero_id = heroes.id
LEFT JOIN
  (VALUES (1, 1), (2, 2), (5, 3), (6, 4), (7, 5), (9, 6), (10, 7), (3, 8), (4, 9), (8, 10)) AS orders(category_id, ordering)
    ON cosmetics.category_id = orders.category_id
ORDER BY heroes.name IS NULL DESC, heroes.name ASC, type_id, rarity_id, ordering, cosmetics.name, event_id;
";

    private $fetchCosmeticById = "
SELECT id, category_id, type_id, rarity_id, hero_id, name, event_id
FROM cosmetics
WHERE id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchCosmetics", $this->fetchCosmetics);
        pg_prepare($this->handler, "fetchCosmeticById", $this->fetchCosmeticById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getCosmetics()
    {
        $response = pg_execute($this->handler, "fetchCosmetics", []);
        if ($response !== false) {
            $cosmetics = [];
            while (($cosmetic = pg_fetch_assoc($response)) !== false) {
                $cosmetics[] = $cosmetic;
            }
            return $cosmetics;
        }
        return null;
    }

    public function getCosmeticById($id)
    {
        $response = pg_execute($this->handler, "fetchCosmeticById", [$id]);
        if ($response !== false && ($cosmetic = pg_fetch_assoc($response)) !== false) {
            return $cosmetic;
        }
        return null;
    }

}
<?php

namespace Overcollector\Dao;

use Overcollector\Cosmetic;

class CosmeticsTable extends Table
{

    private static $instance;

    private $fetchCosmeticById = "
SELECT id, category_id, type_id, rarity_id, hero_id, name, event_id
FROM cosmetics
WHERE id = $1;
";

    private $fetchAllCosmeticsByUserId = "
SELECT cosmetics.id, category_id, type_id, rarity_id, hero_id, cosmetics.name, event_id
FROM cosmetics
  LEFT JOIN heroes
    ON cosmetics.hero_id = heroes.id
  LEFT JOIN categories
    ON cosmetics.category_id = categories.id
  LEFT JOIN types
    ON cosmetics.type_id = types.id
  LEFT JOIN settings
    ON settings.name IN (
    CASE WHEN cosmetics.hero_id IS NULL
      THEN
        'collection-show-hero-allheroes'
    ELSE 'collection-show-hero-' || heroes.slug END,
    CASE WHEN cosmetics.category_id IS NULL
      THEN
        'collection-show-category-default'
    ELSE 'collection-show-category-' || categories.slug END,
    'collection-show-type-' || types.slug
  )
  LEFT JOIN user_settings
    ON settings.id = user_settings.setting_id
WHERE (
        user_settings.user_id IS NULL
        OR user_settings.user_id = $1
      )
      AND (
        (user_settings.value IS NULL AND settings.default = 'true')
        OR (user_settings.value IS NOT NULL AND user_settings.value = 'true')
      )
GROUP BY cosmetics.id, heroes.name
HAVING COUNT(*) > 2
ORDER BY heroes.name IS NULL DESC, heroes.name ASC, type_id, rarity_id, category_id, cosmetics.name, event_id;
";

    private $fetchCosmeticsByUserId = "
SELECT cosmetics.id, category_id, type_id, rarity_id, hero_id, cosmetics.name, event_id
FROM cosmetics
  LEFT JOIN heroes
    ON cosmetics.hero_id = heroes.id
  LEFT JOIN categories
    ON cosmetics.category_id = categories.id
  LEFT JOIN types
    ON cosmetics.type_id = types.id
  LEFT JOIN settings
    ON settings.name IN (
    CASE WHEN cosmetics.hero_id IS NULL
      THEN
        'collection-show-hero-allheroes'
    ELSE 'collection-show-hero-' || heroes.slug END,
    CASE WHEN cosmetics.category_id IS NULL
      THEN
        'collection-show-category-default'
    ELSE 'collection-show-category-' || categories.slug END,
    'collection-show-type-' || types.slug,
    'collection-show-owned-cosmetics'
  )
  LEFT JOIN user_settings
    ON settings.id = user_settings.setting_id
WHERE (
        user_settings.user_id IS NULL
        OR user_settings.user_id = $1
      )
      AND (
        (user_settings.value IS NULL AND settings.default = 'true')
        OR (user_settings.value IS NOT NULL AND user_settings.value = 'true')
        OR (
          settings.name = 'collection-show-owned-cosmetics'
          AND cosmetics.id NOT IN (
            SELECT cosmetic_id
            FROM user_cosmetics
            WHERE user_id = $1
          )
        )
      )
GROUP BY cosmetics.id, heroes.name
HAVING COUNT(*) > 3
ORDER BY heroes.name IS NULL DESC, heroes.name ASC, type_id, rarity_id, category_id, cosmetics.name, event_id;
";

    private $fetchAllOwnedCosmeticsByUserId = "
SELECT id, category_id, type_id, rarity_id, hero_id, name, event_id
FROM cosmetics INNER JOIN user_cosmetics
  ON cosmetics.id = user_cosmetics.cosmetic_id
WHERE user_id = $1
  AND category_id IS NOT NULL
ORDER BY id, type_id, rarity_id, category_id, name, event_id;
";

    private $fetchOwnedCosmeticsByUserId = "
SELECT cosmetics.id, category_id, type_id, rarity_id, hero_id, cosmetics.name, event_id
FROM cosmetics
  LEFT JOIN user_cosmetics
    ON cosmetics.id = user_cosmetics.cosmetic_id
  LEFT JOIN heroes
    ON cosmetics.hero_id = heroes.id
  LEFT JOIN categories
    ON cosmetics.category_id = categories.id
  LEFT JOIN types
    ON cosmetics.type_id = types.id
  LEFT JOIN settings
    ON settings.name IN (
    CASE WHEN cosmetics.hero_id IS NULL
      THEN
        'collection-show-hero-allheroes'
    ELSE 'collection-show-hero-' || heroes.slug END,
    CASE WHEN cosmetics.category_id IS NULL
      THEN
        'collection-show-category-default'
    ELSE 'collection-show-category-' || categories.slug END,
    'collection-show-type-' || types.slug
  )
  LEFT JOIN user_settings
    ON settings.id = user_settings.setting_id
WHERE (
        user_cosmetics.user_id = $1
        OR cosmetics.category_id IS NULL
      )
      AND (
        (user_settings.value IS NULL AND settings.default = 'true')
        OR (user_settings.value IS NOT NULL AND user_settings.value = 'true')
      )
GROUP BY cosmetics.id, heroes.name
HAVING COUNT(*) > 2
ORDER BY heroes.name IS NULL DESC, heroes.name ASC, type_id, rarity_id, category_id, cosmetics.name, event_id;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchCosmeticById", $this->fetchCosmeticById);
        pg_prepare($this->handler, "fetchAllCosmeticsByUserId", $this->fetchAllCosmeticsByUserId);
        pg_prepare($this->handler, "fetchCosmeticsByUserId", $this->fetchCosmeticsByUserId);
        pg_prepare($this->handler, "fetchAllOwnedCosmeticsByUserId", $this->fetchAllOwnedCosmeticsByUserId);
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

    public function getCosmeticById($id)
    {
        $response = pg_execute($this->handler, "fetchCosmeticById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return self::parseCosmetic($row);
        }
        return null;
    }

    public function getAllCosmeticsByUserIdSortByHeroesAndType($userId)
    {
        $cosmetics = [];
        $response = pg_execute($this->handler, "fetchAllCosmeticsByUserId", array($userId));
        if ($response !== false) {
            $cosmetics = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $cosmetic = $this->parseCosmetic($row);
                $cosmetics
                [$cosmetic->getHero() != null ? $cosmetic->getHero()->getId() : 0]
                [$cosmetic->getType()->getId()][] = $cosmetic;
            }
        }
        return $cosmetics;
    }

    public function getCosmeticsByUserIdSortByHeroesAndType($userId)
    {
        $cosmetics = [];
        $response = pg_execute($this->handler, "fetchCosmeticsByUserId", array($userId));
        if ($response !== false) {
            $cosmetics = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $cosmetic = $this->parseCosmetic($row);
                $cosmetics
                [$cosmetic->getHero() != null ? $cosmetic->getHero()->getId() : 0]
                [$cosmetic->getType()->getId()][] = $cosmetic;
            }
        }
        return $cosmetics;
    }

    public function getAllOwnedCosmeticsByUserId($userId)
    {
        $response = pg_execute($this->handler, "fetchAllOwnedCosmeticsByUserId", array($userId));
        if ($response !== false) {
            $cosmetics = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $cosmetics[] = $this->parseCosmetic($row);
            }
            return $cosmetics;
        }
        return [];
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
<?php

namespace Overwatch\Dao;

use Overwatch\Cosmetic;

class CosmeticsTable extends Table
{

    private static $instance;

    private $fetchAllCosmeticsByUserId = "
SELECT cosmetics.id, category_id, type_id, rarity_id, hero_id, cosmetics.name, event_id
FROM cosmetics
  LEFT JOIN heroes
    ON cosmetics.hero_id = heroes.id
  LEFT JOIN categories
    ON cosmetics.category_id = categories.id
  LEFT JOIN settings
    ON settings.name IN (
    CASE WHEN cosmetics.hero_id IS NULL
      THEN
        'collection-show-hero-allheroes'
    ELSE 'collection-show-hero-' || heroes.short END,
    CASE WHEN cosmetics.category_id IS NULL
      THEN
        'collection-show-category-default'
    ELSE 'collection-show-category-' || categories.short END,
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
HAVING COUNT(*) > 2
ORDER BY heroes.name, type_id, rarity_id, category_id, cosmetics.name, event_id;
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
  LEFT JOIN settings
    ON settings.name IN (
    CASE WHEN cosmetics.hero_id IS NULL
      THEN
        'collection-show-hero-allheroes'
    ELSE 'collection-show-hero-' || heroes.short END,
    CASE WHEN cosmetics.category_id IS NULL
      THEN
        'collection-show-category-default'
    ELSE 'collection-show-category-' || categories.short END
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
HAVING COUNT(*) > 1
ORDER BY heroes.name, type_id, rarity_id, category_id, cosmetics.name, event_id;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchAllCosmeticsByUserId", $this->fetchAllCosmeticsByUserId);
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
            $row["event_id"]//TODO add BO
        );
    }

    public function getAllCosmeticsOrderByHeroesAndType()
    {
        $cosmetics = [];
        $response = pg_execute($this->handler, "fetchAllCosmeticsByUserId", array(1));
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

    public function getCosmeticsByUserId($userId)
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
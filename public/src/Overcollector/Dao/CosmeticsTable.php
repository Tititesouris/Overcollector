<?php

namespace Overcollector\Dao;

use Overcollector\Cosmetic;

class CosmeticsTable extends Table
{

    private static $instance;

    private $fetchCosmetics = "
SELECT id, category_id, type_id, rarity_id, hero_id, name, event_id
FROM cosmetics;
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
WHERE user_id = $1 OR cosmetics.category_id IS NULL;
";

    private $addUserCosmetic = "
INSERT INTO user_cosmetics (user_id, cosmetic_id)
SELECT $1, id
FROM cosmetics
WHERE id = $2 AND category_id IS NOT NULL
ON CONFLICT ON CONSTRAINT pk_user_cosmetics
DO NOTHING
RETURNING cosmetic_id;
";

    private $removeUserCosmetic = "
DELETE FROM user_cosmetics
WHERE user_id = $1 AND cosmetic_id = $2
RETURNING cosmetic_id;
";

    private $removeCosmeticsByUserId = "
DELETE FROM user_cosmetics
WHERE user_id = $1;
";

    private $addUserCosmetics = "
INSERT INTO user_cosmetics (user_id, cosmetic_id)
SELECT $1, id
FROM cosmetics
WHERE id = ANY($2::INTEGER[]) AND category_id IS NOT NULL
ON CONFLICT ON CONSTRAINT pk_user_cosmetics
DO NOTHING
RETURNING cosmetic_id;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchCosmetics", $this->fetchCosmetics);
        pg_prepare($this->handler, "fetchCosmeticById", $this->fetchCosmeticById);
        pg_prepare($this->handler, "fetchOwnedCosmeticsByUserId", $this->fetchOwnedCosmeticsByUserId);
        pg_prepare($this->handler, "addUserCosmetic", $this->addUserCosmetic);
        pg_prepare($this->handler, "removeUserCosmetic", $this->removeUserCosmetic);
        pg_prepare($this->handler, "removeCosmeticsByUserId", $this->removeCosmeticsByUserId);
        pg_prepare($this->handler, "addUserCosmetics", $this->addUserCosmetics);
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
                $cosmetic = $this->parseCosmetic($row);
                $cosmetics[$cosmetic->getId()] = $cosmetic;
            }
            return $cosmetics;
        }
        return [];
    }

    public function getCosmeticById($id)
    {
        $response = pg_execute($this->handler, "fetchCosmeticById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseCosmetic($row);
        }
        return null;
    }

    public function getOwnedCosmeticsByUserId($userId)
    {
        $response = pg_execute($this->handler, "fetchOwnedCosmeticsByUserId", array($userId));
        if ($response !== false) {
            $cosmetics = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $cosmetic = $this->parseCosmetic($row);
                $cosmetics[$cosmetic->getId()] = $cosmetic;
            }
            return $cosmetics;
        }
        return [];
    }

    public function updateUserCosmetic($userId, $cosmeticId, $owned)
    {
        if ($owned) {
            $response = pg_execute($this->handler, "addUserCosmetic", array($userId, $cosmeticId));
            if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
                return $this->getCosmeticById($row["cosmetic_id"]);
            }
        } else {
            $response = pg_execute($this->handler, "removeUserCosmetic", array($userId, $cosmeticId));
            if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
                return $row["cosmetic_id"];
            }
        }
        return null;
    }

    public function addUserCosmetics($userId, $cosmeticIds)
    {
        $response = pg_execute($this->handler, "addUserCosmetics", array($userId, "{" . implode(", ", $cosmeticIds) . "}"));
        if ($response !== false) {
            $cosmetics = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $cosmetics[] = $this->getCosmeticById($row["cosmetic_id"]);
            }
            return $cosmetics;
        }
        return null;
    }

    public function setUserCosmetics($userId, $cosmetics)
    {
        pg_query("BEGIN") or die("Could not start transaction\n");
        $response = pg_execute($this->handler, "removeCosmeticsByUserId", array($userId));
        if ($response === false) {
            pg_query("ROLLBACK") or die("Transaction rollback failed\n");
            return false;
        }
        $inserted = 0;
        foreach ($cosmetics as $cosmeticId) {
            $response = pg_execute($this->handler, "addCosmetic", array($userId, $cosmeticId));
            if ($response === false || ($row = pg_fetch_assoc($response)) === false) {
                pg_query("ROLLBACK") or die("Transaction rollback failed\n");
                return false;
            }
            $inserted++;
        }
        if ($inserted != count($cosmetics)) {
            pg_query("ROLLBACK") or die("Transaction rollback failed\n");
        }
        pg_query("COMMIT") or die("Transaction commit failed\n");
        return true;
    }

}
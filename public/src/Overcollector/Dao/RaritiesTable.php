<?php

namespace Overcollector\Dao;

use Overcollector\Rarity;

class RaritiesTable extends Table
{

    private static $instance;

    private $fetchAllRarities = "
SELECT id, name, base_price
FROM rarities;
";

    private $fetchRarityById = "
SELECT id, name, base_price
FROM rarities
WHERE id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchAllRarities", $this->fetchAllRarities);
        pg_prepare($this->handler, "fetchRarityById", $this->fetchRarityById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseRarity($row)
    {
        return Rarity::createRarity(
            intval($row["id"]),
            $row["name"],
            intval($row["base_price"])
        );
    }

    public function getRarityById($id) {
        $response = pg_execute($this->handler, "fetchRarityById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseRarity($row);
        }
        return null;
    }
}
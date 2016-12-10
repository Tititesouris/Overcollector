<?php

namespace Overcollector\Dao;


class RaritiesTable extends Table
{

    private static $instance;

    private $fetchRarities = "
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
        pg_prepare($this->handler, "fetchRarities", $this->fetchRarities);
        pg_prepare($this->handler, "fetchRarityById", $this->fetchRarityById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getRarities()
    {
        $response = pg_execute($this->handler, "fetchRarities", []);
        if ($response !== false) {
            $rarities = [];
            while (($rarity = pg_fetch_assoc($response)) !== false) {
                $rarities[] = $rarity;
            }
            return $rarities;
        }
        return null;
    }

    public function getRarityById($id)
    {
        $response = pg_execute($this->handler, "fetchRarityById", [$id]);
        if ($response !== false && ($rarity = pg_fetch_assoc($response)) !== false) {
            return $rarity;
        }
        return null;
    }

}
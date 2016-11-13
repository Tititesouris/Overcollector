<?php
namespace Overcollector\Dao;

use Overcollector\Hero;

class HeroesTable extends Table
{

    private static $instance;

    private $fetchAllHeroes = "
SELECT id, name, slug
FROM heroes
ORDER BY name;
";

    private $fetchHeroById = "
SELECT id, name, slug
FROM heroes
WHERE id = $1
;";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchAllHeroes", $this->fetchAllHeroes);
        pg_prepare($this->handler, "fetchHeroById", $this->fetchHeroById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseHero($row)
    {
        return Hero::createHero(
            intval($row["id"]),
            $row["name"],
            $row["slug"]
        );
    }

    public function getAllHeroes()
    {
        $response = pg_execute($this->handler, "fetchAllHeroes", array());
        if ($response !== false) {
            $heroes = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $heroes[] = $this->parseHero($row);
            }
            return $heroes;
        }
        return [];
    }

    public function getHeroById($id)
    {
        $response = pg_execute($this->handler, "fetchHeroById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseHero($row);
        }
        return null;
    }

    public function getAllHeroesSortById()
    {
        $response = pg_execute($this->handler, "fetchAllHeroes", array());
        if ($response !== false) {
            $heroes = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $hero = $this->parseHero($row);
                $heroes[$hero->getId()] = $hero;
            }
            return $heroes;
        }
        return [];
    }

}
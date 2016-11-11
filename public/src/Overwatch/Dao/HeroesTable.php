<?php
namespace Overwatch\Dao;

use Overwatch\Hero;

class HeroesTable extends Table
{

    private static $instance;

    private $fetchAllHeroes = "SELECT id, name, short FROM heroes ORDER BY name;";

    private $fetchHeroesById = "SELECT id, name, short FROM heroes WHERE id = $1;";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchAllHeroes", $this->fetchAllHeroes);
        pg_prepare($this->handler, "fetchHeroesById", $this->fetchHeroesById);
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
            $row["short"]
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
        $response = pg_execute($this->handler, "fetchHeroesById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseHero($row);
        }
        return null;
    }

    public function getAllHeroesOrderById()
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
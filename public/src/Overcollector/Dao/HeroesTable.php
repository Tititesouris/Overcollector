<?php
namespace Overcollector\Dao;

class HeroesTable extends Table
{

    private static $instance;

    private $fetchHeroes = "
SELECT id, name, slug
FROM heroes
ORDER BY name;
";

    private $fetchHeroById = "
SELECT id, name, slug
FROM heroes
WHERE id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchHeroes", $this->fetchHeroes);
        pg_prepare($this->handler, "fetchHeroById", $this->fetchHeroById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getHeroes()
    {
        $response = pg_execute($this->handler, "fetchHeroes", []);
        if ($response !== false) {
            $heroes = [];
            while (($hero = pg_fetch_assoc($response)) !== false) {
                $heroes[] = $hero;
            }
            return $heroes;
        }
        return null;
    }

    public function getHeroById($id)
    {
        $response = pg_execute($this->handler, "fetchHeroById", [$id]);
        if ($response !== false && ($hero = pg_fetch_assoc($response)) !== false) {
            return $hero;
        }
        return null;
    }

}
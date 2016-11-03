<?php
namespace Overwatch\Dao;

use Overwatch\Character;

require_once(__DIR__ . "/Database.php");

class CharactersTable
{

    private static $instance;

    private $handler;

    private $fetchAllCharacters = "SELECT id, name FROM characters ORDER BY name;";

    private $fetchCharacterById = "SELECT id, name FROM characters WHERE id = $1;";

    private function __construct()
    {
        $this->handler = Database::getInstance()->getHandler();
        pg_prepare($this->handler, "fetchAllCharacters", $this->fetchAllCharacters);
        pg_prepare($this->handler, "fetchCharacterById", $this->fetchCharacterById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseCharacter($row)
    {
        return Character::createCharacter(
            intval($row["id"]),
            $row["name"]
        );
    }

    public function getAllCharacters()
    {
        $response = pg_execute($this->handler, "fetchAllCharacters", array());
        if ($response !== false) {
            $characters = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $characters[] = $this->parseCharacter($row);
            }
            return $characters;
        }
        return [];
    }

    public function getCharacterById($id)
    {
        $response = pg_execute($this->handler, "fetchCharacterById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseCharacter($row);
        }
        return null;
    }

    public function getAllCharactersOrderById()
    {
        $response = pg_execute($this->handler, "fetchAllCharacters", array());
        if ($response !== false) {
            $characters = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $character = $this->parseCharacter($row);
                $characters[$character->getId()] = $character;
            }
            return $characters;
        }
        return [];
    }

}
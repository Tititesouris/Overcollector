<?php
namespace Overwatch;

use JsonSerializable;

class User implements JsonSerializable
{
    private $id;

    private $username;

    private $cosmetics;

    function __construct($id, $username)
    {
        $this->id = $id;
        $this->username = $username;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getUsername()
    {
        return $this->username;
    }

    public function getCosmetics($characterId)
    {
        $cosmetics = [];
        foreach ($this->cosmetics as $cosmetic) {
            if (($cosmetic->getCharacter() === null && $characterId === 0) ||
                ($cosmetic->getCharacter() !== null && $cosmetic->getCharacter()->getId() === $characterId)
            ) {
                $cosmetics[$cosmetic->getType()->getId()][] = $cosmetic;
            }
        }
        return $cosmetics;
    }

    public function setCosmetics($cosmetics)
    {
        $this->cosmetics = $cosmetics;
    }

    public function hasCosmetic($id)
    {
        foreach ($this->cosmetics as $cosmetic) {
            if ($cosmetic->getId() === $id)
                return true;
        }
        return false;
    }

    public function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "username" => $this->username,
        ];
    }

}
<?php

namespace Overcollector;


use JsonSerializable;

class WishlistItem implements JsonSerializable
{

    private $cosmetic;

    private $favorite;

    public function __construct($cosmetic, $favorite)
    {
        $this->cosmetic = $cosmetic;
        $this->favorite = $favorite;
    }

    public static function createWishlistItem($cosmetic, $favorite)
    {
        return new self($cosmetic, $favorite);
    }

    function jsonSerialize()
    {
        return [
            "cosmetic" => $this->cosmetic,
            "favorite" => $this->favorite
        ];
    }
}

<?php

namespace Overcollector\Bo;


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

    function jsonSerialize()
    {
        return [
            "cosmetic" => $this->cosmetic,
            "favorite" => $this->favorite
        ];
    }
}

<?php

namespace Overcollector\Bo;

use JsonSerializable;

class Type implements JsonSerializable
{

    private $id;

    private $name;

    private $slug;

    public function __construct($id, $name, $slug)
    {
        $this->id = $id;
        $this->name = $name;
        $this->slug = $slug;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getSlug()
    {
        return $this->slug;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "slug" => $this->slug
        ];
    }

}
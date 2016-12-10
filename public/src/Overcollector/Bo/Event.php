<?php

namespace Overcollector\Bo;

use JsonSerializable;


class Event implements JsonSerializable
{

    private $id;

    private $name;

    private $start;

    private $end;

    public function __construct($id, $name, $start, $end)
    {
        $this->id = $id;
        $this->name = $name;
        $this->start = $start;
        $this->end = $end;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getStart()
    {
        return $this->start;
    }

    public function getEnd()
    {
        return $this->end;
    }

    function jsonSerialize()
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "start" => $this->start,
            "end" => $this->end
        ];
    }
}
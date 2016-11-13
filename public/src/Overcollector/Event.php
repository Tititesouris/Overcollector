<?php

namespace Overcollector;

use JsonSerializable;


class Event implements JsonSerializable
{
    private static $events = array();

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

    public static function createEvent($id, $name, $start, $end)
    {
        if (!array_key_exists($id, self::$events)) {
            self::$events[$id] = new Event($id, $name, $start, $end);
        }
        return self::$events[$id];
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
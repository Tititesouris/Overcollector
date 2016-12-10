<?php

namespace Overcollector\Services;


use Overcollector\Bo\Event;
use Overcollector\Dao\EventsTable;

class EventsService
{
    private static $events = [];

    public static function getEventById($id)
    {
        if (!isset(self::$events[$id])) {
            $event = EventsTable::getInstance()->getEventById($id);
            if ($event === null)
                return null;
            self::$events[intval($event["id"])] = new Event(
                intval($event["id"]),
                $event["name"],
                $event["start"],
                $event["end"]
            );
        }
        return self::$events[$id];
    }

    public static function getEvents()
    {
        if (count(self::$events) === 0) {
            $events = EventsTable::getInstance()->getEvents();
            if ($events === null)
                return null;
            foreach ($events as $event) {
                self::$events[intval($event["id"])] = new Event(
                    intval($event["id"]),
                    $event["name"],
                    $event["start"],
                    $event["end"]
                );
            }
        }
        return self::$events;
    }

}
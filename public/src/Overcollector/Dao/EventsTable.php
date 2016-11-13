<?php

namespace Overcollector\Dao;

use Overcollector\Event;


class EventsTable extends Table
{

    private static $instance;

    private $fetchAllEvents = "
SELECT id, name, start, \"end\"
FROM events
ORDER BY name;
";

    private $fetchEventById = "
SELECT id, name, start, \"end\"
FROM events
WHERE id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchAllEvents", $this->fetchAllEvents);
        pg_prepare($this->handler, "fetchEventById", $this->fetchEventById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseEvent($row)
    {
        return Event::createEvent(
            intval($row["id"]),
            $row["name"],
            $row["start"],
            $row["end"]
        );
    }

    public function getAllEvents()
    {
        $response = pg_execute($this->handler, "fetchAllEvents", array());
        if ($response !== false) {
            $events = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $events[] = $this->parseEvent($row);
            }
            return $events;
        }
        return [];
    }

    public function getEventById($id)
    {
        $response = pg_execute($this->handler, "fetchEventById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseEvent($row);
        }
        return null;
    }

}
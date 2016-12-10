<?php

namespace Overcollector\Dao;


class EventsTable extends Table
{

    private static $instance;

    private $fetchEvents = "
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
        pg_prepare($this->handler, "fetchEvents", $this->fetchEvents);
        pg_prepare($this->handler, "fetchEventById", $this->fetchEventById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getEvents()
    {
        $response = pg_execute($this->handler, "fetchEvents", []);
        if ($response !== false) {
            $events = [];
            while (($event = pg_fetch_assoc($response)) !== false) {
                $events[] = $event;
            }
            return $events;
        }
        return null;
    }

    public function getEventById($id)
    {
        $response = pg_execute($this->handler, "fetchEventById", [$id]);
        if ($response !== false && ($event = pg_fetch_assoc($response)) !== false) {
            return $event;
        }
        return null;
    }

}
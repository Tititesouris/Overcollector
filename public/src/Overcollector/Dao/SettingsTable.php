<?php

namespace Overcollector\Dao;


class SettingsTable extends Table
{
    private static $instance;

    private $fetchSettings = "
SELECT id, name, description, type, \"default\", min, max
FROM settings;
";

    private $fetchSettingById = "
SELECT id, name, description, type, \"default\", min, max
FROM settings
WHERE id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchSettings", $this->fetchSettings);
        pg_prepare($this->handler, "fetchSettingById", $this->fetchSettingById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getSettings()
    {
        $response = pg_execute($this->handler, "fetchSettings", []);
        if ($response !== false) {
            $settings = [];
            while (($setting = pg_fetch_assoc($response)) !== false) {
                $settings[] = $setting;
            }
            return $settings;
        }
        return null;
    }

    public function getSettingById($id)
    {
        $response = pg_execute($this->handler, "fetchSettingById", [$id]);
        if ($response !== false && ($setting = pg_fetch_assoc($response)) !== false) {
            return $setting;
        }
        return null;
    }


}
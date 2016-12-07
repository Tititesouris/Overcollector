<?php

namespace Overcollector\Dao;


use Overcollector\Setting;
use Overcollector\UserSetting;

class SettingsTable extends Table
{
    private static $instance;

    private $fetchSettings = "
SELECT id, name, description, \"default\", min, max
FROM settings;
";

    private $fetchUserSettings = "
SELECT id, name, description, COALESCE(value, \"default\") AS value
FROM settings LEFT JOIN (
    SELECT value, setting_id
    FROM user_settings
    WHERE user_id = $1
  ) AS user_settings
  ON settings.id = user_settings.setting_id
ORDER BY id;
";

    private $fetchUserSetting = "
SELECT id, name, description, value
FROM settings LEFT JOIN user_settings
  ON settings.id = user_settings.setting_id
WHERE id = $1;
";

    private $updateUserSetting = "
INSERT INTO user_settings (user_id, setting_id, value)
SELECT $1, id, $3
FROM settings
WHERE name = $2 AND (
  (\"default\" IN ('true', 'false') AND $3 IN ('true', 'false'))
  OR (\"default\" ~ '^-?[0-9]+$' AND $3 ~ '^-?[0-9]+$' AND $3::INTEGER BETWEEN min::INTEGER AND max::INTEGER)
)
ON CONFLICT ON CONSTRAINT pk_user_settings
DO UPDATE SET value = $3
RETURNING setting_id;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchSettings", $this->fetchSettings);
        pg_prepare($this->handler, "fetchUserSettings", $this->fetchUserSettings);
        pg_prepare($this->handler, "fetchUserSetting", $this->fetchUserSetting);
        pg_prepare($this->handler, "updateUserSetting", $this->updateUserSetting);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseSetting($row)
    {
        return Setting::createSetting(
            intval($row["id"]),
            $row["name"],
            $row["description"],
            $row["default"],
            $row["min"],
            $row["max"]
        );
    }

    private static function parseUserSetting($row)
    {
        return UserSetting::createUserSetting(
            intval($row["id"]),
            $row["name"],
            $row["description"],
            $row["value"]
        );
    }

    public function getAllSettings()
    {
        $response = pg_execute($this->handler, "fetchSettings", array());
        if ($response !== false) {
            $settings = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $setting = $this->parseSetting($row);
                $settings[$setting->getName()] = $setting;
            }
            return $settings;
        }
        return [];
    }

    public function getUserSettings($userId)
    {
        $response = pg_execute($this->handler, "fetchUserSettings", array($userId));
        if ($response !== false) {
            $settings = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $setting = $this->parseUserSetting($row);
                $settings[$setting->getName()] = $setting;
            }
            return $settings;
        }
        return [];
    }

    public function setUserSetting($userId, $settingName, $value)
    {
        $response = pg_execute($this->handler, "updateUserSetting", array($userId, $settingName, $value));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            $response = pg_execute($this->handler, "fetchUserSetting", array($row["setting_id"]));
            if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
                return $this->parseUserSetting($row);
            }
        }
        return null;
    }

}
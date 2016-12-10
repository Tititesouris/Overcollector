<?php

namespace Overcollector\Dao;


class UserSettingsTable extends Table
{

    private static $instance;

    private $fetchUserSettingsByUserId = "
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
SELECT id, name, description, COALESCE(value, \"default\") AS value
FROM settings LEFT JOIN (
    SELECT value, setting_id
    FROM user_settings
    WHERE user_id = $1
  ) AS user_settings
  ON settings.id = user_settings.setting_id
WHERE setting_id = $2
ORDER BY id;
";

    private $addUserSetting = "
INSERT INTO user_settings (user_id, setting_id, value)
SELECT $1, id, $3
FROM settings
WHERE id = $2 AND (
  (\"default\" IN ('true', 'false') AND $3 IN ('true', 'false'))
  OR (\"default\" ~ '^-?[0-9]+$' AND $3 ~ '^-?[0-9]+$' AND $3::INTEGER BETWEEN min::INTEGER AND max::INTEGER)
)
ON CONFLICT ON CONSTRAINT pk_user_settings
DO UPDATE SET value = $3
RETURNING setting_id AS id;
";

    private $removeUserSetting = "
DELETE FROM user_settings
WHERE user_id = $1 AND setting_id = $2
RETURNING setting_id AS id;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchUserSettingsByUserId", $this->fetchUserSettingsByUserId);
        pg_prepare($this->handler, "fetchUserSetting", $this->fetchUserSetting);
        pg_prepare($this->handler, "addUserSetting", $this->addUserSetting);
        pg_prepare($this->handler, "removeUserSetting", $this->removeUserSetting);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getUserSettingsByUserId($id)
    {
        $response = pg_execute($this->handler, "fetchUserSettingsByUserId", [$id]);
        if ($response !== false) {
            $userSettings = [];
            while (($userSetting = pg_fetch_assoc($response)) !== false) {
                $userSettings[] = $userSetting;
            }
            return $userSettings;
        }
        return null;
    }

    public function getUserSetting($userId, $settingId)
    {
        $response = pg_execute($this->handler, "fetchUserSetting", [$userId, $settingId]);
        if ($response !== false && ($userSetting = pg_fetch_assoc($response)) !== false) {
            return $userSetting;
        }
        return null;
    }

    public function addUserSetting($userId, $settingId, $value)
    {
        $response = pg_execute($this->handler, "addUserSetting", [$userId, $settingId, $value]);
        if ($response !== false && ($userSetting = pg_fetch_assoc($response)) !== false) {
            return $userSetting;
        }
        return null;
    }

    public function removeUserSetting($userId, $settingId)
    {
        $response = pg_execute($this->handler, "removeUserSetting", [$userId, $settingId]);
        if ($response !== false && ($userSetting = pg_fetch_assoc($response)) !== false) {
            return $userSetting;
        }
        return null;
    }
}
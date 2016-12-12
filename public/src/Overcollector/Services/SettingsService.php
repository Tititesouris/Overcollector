<?php

namespace Overcollector\Services;


use Overcollector\Bo\Setting;
use Overcollector\Dao\SettingsTable;

class SettingsService
{

    private static $settings = [];

    private static $settingsSortedByName;

    public static function getSettingById($id)
    {
        if (!isset(self::$settings[$id])) {
            $setting = SettingsTable::getInstance()->getSettingById($id);
            if ($setting === null)
                return null;
            $setting = new Setting(
                intval($setting["id"]),
                $setting["name"],
                $setting["description"],
                $setting["type"],
                self::parseValue($setting["default"], $setting["type"]),
                self::parseValue($setting["min"], $setting["type"]),
                self::parseValue($setting["max"], $setting["type"])
            );
            self::$settings[$setting->getId()] = $setting;
            self::$settingsSortedByName[$setting->getName()] = $setting;
        }
        return self::$settings[$id];
    }

    public static function getSettings()
    {
        if (count(self::$settings) === 0) {
            $settings = SettingsTable::getInstance()->getSettings();
            if ($settings === null)
                return null;
            foreach ($settings as $setting) {
                $setting = new Setting(
                    intval($setting["id"]),
                    $setting["name"],
                    $setting["description"],
                    $setting["type"],
                    self::parseValue($setting["default"], $setting["type"]),
                    self::parseValue($setting["min"], $setting["type"]),
                    self::parseValue($setting["max"], $setting["type"])
                );
                self::$settings[$setting->getId()] = $setting;
                self::$settingsSortedByName[$setting->getName()] = $setting;
            }
        }
        return self::$settings;
    }

    public static function getSettingsSortedByName()
    {
        self::getSettings();
        return self::$settingsSortedByName;
    }

    private static function parseValue($value, $type)
    {
        switch ($type) {
            case "BOOLEAN":
                return $value === "true";
            case "INTEGER":
                return intval($value);
            default:
                return $value;
        }
    }

}
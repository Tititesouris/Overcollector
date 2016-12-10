<?php

namespace Overcollector\Services;


use Overcollector\Bo\UserSetting;
use Overcollector\Dao\UserSettingsTable;

class UserSettingsService
{

    public static function getUserSettingsByUserId($id)
    {
        $result = [];
        $userSettings = UserSettingsTable::getInstance()->getUserSettingsByUserId($id);
        if ($userSettings === null)
            return null;
        foreach ($userSettings as $userSetting) {
            $userSetting = new UserSetting(
                intval($userSetting["id"]),
                $userSetting["name"],
                $userSetting["description"],
                self::parseValue($userSetting["value"])
            );
            $result[$userSetting->getSettingId()] = $userSetting;
        }
        return $result;
    }

    public static function getUserSettingsByUserIdSortedByName($id)
    {
        $result = [];
        $userSettings = UserSettingsTable::getInstance()->getUserSettingsByUserId($id);
        if ($userSettings === null)
            return null;
        foreach ($userSettings as $userSetting) {
            $userSetting = new UserSetting(
                intval($userSetting["id"]),
                $userSetting["name"],
                $userSetting["description"],
                self::parseValue($userSetting["value"])
            );
            $result[$userSetting->getName()] = $userSetting;
        }
        return $result;
    }

    public static function getUserSetting($userId, $settingId)
    {
        $userSetting = UserSettingsTable::getInstance()->getUserSetting($userId, $settingId);
        if ($userSetting === null)
            return null;
        $userSetting = new UserSetting(
            intval($userSetting["id"]),
            $userSetting["name"],
            $userSetting["description"],
            self::parseValue($userSetting["value"])
        );
        return $userSetting;
    }

    public static function addUserSetting($userId, $settingId, $value)
    {
        $userSetting = UserSettingsTable::getInstance()->addUserSetting($userId, $settingId, $value);
        if ($userSetting === null)
            return false;
        return true;
    }

    public static function removeUserSetting($userId, $settingId)
    {
        $userSetting = UserSettingsTable::getInstance()->removeUserSetting($userId, $settingId);
        if ($userSetting === null)
            return false;
        return true;
    }

    private static function parseValue($value)
    {
        if ($value === "true")
            return true;
        if ($value === "false")
            return false;
        return intval($value);
    }
}
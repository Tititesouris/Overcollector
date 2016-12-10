<?php

namespace Overcollector\Services;


use Overcollector\Dao\UserCosmeticsTable;

class UserCosmeticsService
{

    public static function getUserCosmeticsByUserId($id)
    {
        $result = [];
        $userCosmetics = UserCosmeticsTable::getInstance()->getUserCosmeticsByUserId($id);
        if ($userCosmetics === null)
            return null;
        foreach ($userCosmetics as $userCosmetic) {
            $result[intval($userCosmetic["id"])] = CosmeticsService::getCosmeticById($userCosmetic["id"]);
        }
        return $result;
    }

    public static function setUserCosmeticsByUserId($id, $cosmetics)
    {
        return UserCosmeticsTable::getInstance()->setUserCosmetics($id, $cosmetics);
    }

    public static function addUserCosmetic($userId, $cosmeticId)
    {
        $success = UserCosmeticsTable::getInstance()->addUserCosmetic($userId, $cosmeticId);
        if ($success === null)
            return false;
        return true;
    }

    public static function addUserCosmetics($userId, $cosmeticIds)
    {
        $success = true;
        foreach ($cosmeticIds as $cosmeticId) {
            $success = self::addUserCosmetic($userId, $cosmeticId) && $success;
        }
        return $success;
    }

    public static function removeUserCosmetic($userId, $cosmeticId)
    {
        $success = UserCosmeticsTable::getInstance()->removeUserCosmetic($userId, $cosmeticId);
        if ($success === null)
            return false;
        return true;
    }

}
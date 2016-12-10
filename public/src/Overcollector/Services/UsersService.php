<?php

namespace Overcollector\Services;


use Overcollector\Bo\User;
use Overcollector\Dao\UsersTable;

class UsersService
{

    public static function addOrGetUser($battleid, $battletag)
    {
        $user = UsersTable::getInstance()->getUserByBattleid($battleid, $battletag);
        if ($user === null)
            return null;
        return new User(
            intval($user["id"]),
            intval($user["battleid"]),
            $user["battletag"],
            null,
            null
        );
    }

}
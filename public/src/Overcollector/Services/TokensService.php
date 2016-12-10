<?php

namespace Overcollector\Services;


use Overcollector\Bo\Token;
use Overcollector\Dao\TokensTable;

class TokensService
{

    public static function createAccessToken() {
        $token = TokensTable::getInstance()->createAccessToken();
        if ($token === null)
            return null;
        return new Token(
            $token["token"],
            $token["created_at"],
            $token["expires_at"]
        );
    }

    public static function useAccessToken($token)
    {
        $token = TokensTable::getInstance()->useAccessToken($token);
        if ($token === null)
            return null;
        return new Token(
            $token["token"],
            $token["created_at"],
            $token["expires_at"]
        );
    }

}
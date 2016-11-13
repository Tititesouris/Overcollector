<?php

namespace Overcollector;

use JsonSerializable;

class Token implements JsonSerializable
{

    private $token;

    private $createdAt;

    private $expiresAt;

    public function __construct($token, $createdAt, $expiresAt)
    {
        $this->token = $token;
        $this->createdAt = $createdAt;
        $this->expiresAt = $expiresAt;
    }

    public static function createToken($token, $createdAt, $expiresAt)
    {
        return new Token($token, $createdAt, $expiresAt);
    }

    public function getToken()
    {
        return $this->token;
    }

    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    public function getExpiresAt()
    {
        return $this->expiresAt;
    }

    function jsonSerialize()
    {
        return [
            "token" => $this->token,
            "created_at" => $this->createdAt,
            "expires_at" => $this->expiresAt
        ];
    }

}
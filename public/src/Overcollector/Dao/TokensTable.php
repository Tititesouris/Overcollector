<?php

namespace Overcollector\Dao;


class TokensTable extends Table
{

    private static $instance;

    private $createToken = "
INSERT INTO tokens (expires_at)
VALUES ((now() AT TIME ZONE 'UTC') + INTERVAL '1 second' * $1)
RETURNING token, created_at, expires_at;
";

    private $useToken = "
DELETE FROM tokens
WHERE token = $1 AND (now() AT TIME ZONE 'UTC') < expires_at
RETURNING token, created_at, expires_at;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "createToken", $this->createToken);
        pg_prepare($this->handler, "useToken", $this->useToken);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }


    public function createAccessToken($seconds = 300)
    {
        $response = pg_execute($this->handler, "createToken", [$seconds]);
        if ($response !== false && ($token = pg_fetch_assoc($response)) !== false) {
            return $token;
        }
        return null;
    }

    public function useAccessToken($token)
    {
        $response = pg_execute($this->handler, "useToken", [$token]);
        if ($response !== false && ($token = pg_fetch_assoc($response)) !== false) {
            return $token;
        }
        return null;
    }

}
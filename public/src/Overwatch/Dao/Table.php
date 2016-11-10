<?php

namespace Overwatch\Dao;

require_once(__DIR__ . "/Database.php");

abstract class Table
{

    protected $handler;

    protected function __construct()
    {
        $this->handler = Database::getInstance()->getHandler();
    }

}
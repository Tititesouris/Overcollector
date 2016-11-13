<?php
require_once(__DIR__ . "/required.php");

use \Overcollector\Dao\TokensTable;
use \Overcollector\Dao\UsersTable;

if (!isUserLoggedIn()) {
    if (isset($_GET["state"]) && isset($_GET["code"])) {
        if (TokensTable::getInstance()->useAccessToken($_GET["state"]) !== null) {
            //TODO check what I need to get the username
        }
    } else if (isset($_GET["region"]) && in_array($_GET["region"], ["eu", "us", "kr", "tw", "cn"])) {
        $config = parse_ini_file(__DIR__ . "/../overcollector.ini", true);
        $battlenet = $config["battlenet"];
        if ($_GET["region"] !== "cn") {
            $url = "https://" . $_GET["region"] . ".battle.net/oauth/authorize";
        } else {
            $url = "https://www.battlenet.com.cn/oauth/authorize";
        }
        $state = TokensTable::getInstance()->createAccessToken();
        if ($state !== null) {
            header("Location: " . $url . "?client_id=" . $battlenet["key"] . "&redirect_uri=" . $battlenet["uri"] . "&state=" . $state . "&response_type=code");
            die();
        }
    }
}
<?php
require_once(__DIR__ . "/required.php");

$config = parse_ini_file(__DIR__ . "/../overcollector.ini", true);
$battlenet = $config["battlenet"];

use \Overcollector\Dao\TokensTable;
use \Overcollector\Dao\UsersTable;

if (!isUserLoggedIn()) {
    if (isset($_GET["state"]) && isset($_GET["code"])) {
        if (TokensTable::getInstance()->useAccessToken($_GET["state"]) !== null) {
            var_dump($_GET);
            $response = sendPost("https://eu.battle.net/oauth/token", [//TODO check right region
                "grant_type" => "authorization_code",
                "code" => $_GET["code"],
                "redirect_uri" => $battlenet["uri"]
            ], $battlenet["key"], $battlenet["secret"]);
            var_dump($response);
            if ($response) {
                $responseJson = json_decode($response, true);
                if (!array_key_exists("error", $responseJson) && array_key_exists("access_token", $responseJson)) {
                    $response = sendGet("https://eu.api.battle.net/account/user", [//TODO check region
                        "access_token" => $responseJson["access_token"]
                    ]);
                    var_dump($response);
                }
            }
        }
    } else if (isset($_GET["region"]) && in_array($_GET["region"], ["eu", "us", "kr", "tw", "cn"])) {
        if ($_GET["region"] !== "cn") {
            $url = "https://" . $_GET["region"] . ".battle.net/oauth/authorize";
        } else {
            $url = "https://www.battlenet.com.cn/oauth/authorize";
        }
        $token = TokensTable::getInstance()->createAccessToken();
        if ($token !== null) {
            header("Location: " . $url . "?client_id=" . $battlenet["key"] . "&redirect_uri=" . $battlenet["uri"] . "&state=" . $token->getToken() . "&response_type=code");
            die();
        }
    }
}
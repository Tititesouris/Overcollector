<?php
require_once(__DIR__ . "/required.php");

$config = parse_ini_file(__DIR__ . "/../overcollector.ini", true);
$battlenet = $config["battlenet"];

use \Overcollector\Services\TokensService;
use \Overcollector\Services\UsersService;

if (!isUserLoggedIn()) {
    if (isset($_SESSION["region"])) {
        if (isset($_GET["state"]) && isset($_GET["code"])) {
            if (TokensService::useAccessToken($_GET["state"]) !== null) {
                if ($_SESSION["region"] !== "CN") {
                    $url = "https://" . $_SESSION["region"] . ".battle.net/oauth/token";
                } else {
                    $url = "https://www.battlenet.com.cn/oauth/token";
                }
                $response = sendPost($url, [
                    "grant_type" => "authorization_code",
                    "code" => $_GET["code"],
                    "redirect_uri" => $battlenet["uri"]
                ], $battlenet["key"], $battlenet["secret"]);
                if ($response) {
                    $responseJson = json_decode($response, true);
                    if (!isset($responseJson["error"]) && isset($responseJson["access_token"])) {
                        if ($_SESSION["region"] !== "CN") {
                            $url = "https://" . $_SESSION["region"] . ".api.battle.net/account/user";
                        } else {
                            $url = "https://api.battlenet.com.cn/account/user";
                        }
                        $response = sendGet($url, [
                            "access_token" => $responseJson["access_token"]
                        ]);
                        if ($response) {
                            $responseJson = json_decode($response, true);
                            if (isset($responseJson["id"]) && array_key_exists("battletag", $responseJson)) {
                                $user = UsersService::addOrGetUser($responseJson["id"], $responseJson["battletag"]);
                                if ($user !== null) {
                                    $_SESSION["user"] = $user;
                                    $_SESSION["refreshuser"] = true;
                                    header("Location: ./");
                                    die();
                                } else {
                                    echo "Error: Couldn't create user account.";
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ($_SESSION["region"] !== "CN") {
                $url = "https://" . $_SESSION["region"] . ".battle.net/oauth/authorize";
            } else {
                $url = "https://www.battlenet.com.cn/oauth/authorize";
            }
            $token = TokensService::createAccessToken();
            if ($token !== null) {
                header("Location: " . $url . "?client_id=" . $battlenet["key"] . "&redirect_uri=" . $battlenet["uri"] . "&state=" . $token->getToken() . "&response_type=code");
                die();
            }
        }
    } else if (isset($_GET["region"]) && in_array(strtoupper($_GET["region"]), ["EU", "US", "KR", "TW", "CN", "SEA"])) {
        $_SESSION["region"] = strtoupper($_GET["region"]) !== "SEA" ? strtoupper($_GET["region"]) : "US";
        header("Location: ./login.php");
        die();
    } else if ($config["config"]["debug"] && isset($_GET["debug"])) {
        $user = UsersService::addOrGetUser(123, "Debug#12345");
        if ($user !== null) {
            $_SESSION["user"] = $user;
            $_SESSION["refreshuser"] = true;
            header("Location: ./");
            die();
        } else {
            echo "Error: Couldn't create user account.";
        }
    } else {
        echo $twig->render("login.twig");
    }
} else {
    header("Location: ./");
    die();
}
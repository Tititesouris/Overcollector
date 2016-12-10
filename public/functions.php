<?php
$config = parse_ini_file(__DIR__ . "/../overcollector.ini", true);
$debug = $config["config"]["debug"];
$localhost = $config["config"]["localhost"];

use \Overcollector\Services\CategoriesService;
use \Overcollector\Services\TypesService;
use \Overcollector\Services\RaritiesService;
use \Overcollector\Services\HeroesService;
use \Overcollector\Services\EventsService;
use \Overcollector\Services\CosmeticsService;
use \Overcollector\Services\SettingsService;
use \Overcollector\Services\UserCosmeticsService;
use \Overcollector\Services\UserSettingsService;

function sendPost($url, $params, $login = null, $password = null)
{
    global $debug, $localhost;
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Accept: application/json"]);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, !$localhost);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
    if ($login !== null) {
        curl_setopt($ch, CURLOPT_USERPWD, $login . ":" . $password);
    }
    $response = curl_exec($ch);
    if ($debug) {
        if ($errno = curl_errno($ch)) {
            $error_message = curl_strerror($errno);
            echo "cURL error ({$errno}): {$error_message}";
        }
    }
    return $response;
}

function sendGet($url, $params)
{
    global $debug, $localhost;
    $ch = curl_init(($params !== null) ? $url . "?" . http_build_query($params) : $url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Accept: application/json"]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, !$localhost);
    $response = curl_exec($ch);
    if ($debug) {
        if ($errno = curl_errno($ch)) {
            $error_message = curl_strerror($errno);
            echo "cURL error ({$errno}): {$error_message}";
        }
    }
    return $response;
}

function isUserLoggedIn()
{
    return isset($_SESSION["user"]);
}

function stupidBoolVal($boolean)
{
    return $boolean ? "true" : "false";
}

function updateGlobalSession()
{
    if (isset($_SESSION["refreshglobal"]) && $_SESSION["refreshglobal"]) {
        $_SESSION["refreshglobal"] = false;
        $_SESSION["categories"] = CategoriesService::getCategories();
        $_SESSION["types"] = TypesService::getTypes();
        $_SESSION["rarities"] = RaritiesService::getRarities();
        $_SESSION["heroes"] = HeroesService::getHeroes();
        $_SESSION["events"] = EventsService::getEvents();
        $_SESSION["cosmetics"] = CosmeticsService::getCosmetics();
        $_SESSION["settings"] = SettingsService::getSettings();
    }
}

function updateUserSession()
{
    if (isset($_SESSION["refreshuser"]) && $_SESSION["refreshuser"]) {
        $_SESSION["refreshuser"] = false;
        $_SESSION["user"]->setCosmetics(UserCosmeticsService::getUserCosmeticsByUserId($_SESSION["user"]->getId()));
        $_SESSION["user"]->setSettings(UserSettingsService::getUserSettingsByUserIdSortedByName($_SESSION["user"]->getId()));
        return true;
    }
    return false;
}
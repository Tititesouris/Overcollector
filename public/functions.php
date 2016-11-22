<?php
$config = parse_ini_file(__DIR__ . "/../overcollector.ini", true);
$debug = $config["config"]["debug"];
$localhost = $config["config"]["localhost"];

function sendPost($url, $params, $login = null, $password = null)
{
    global $debug, $localhost;
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array("Accept: application/json"));
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
    curl_setopt($ch, CURLOPT_HTTPHEADER, array("Accept: application/json"));
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

use Overcollector\Dao\HeroesTable;
use Overcollector\Dao\CategoriesTable;
use Overcollector\Dao\TypesTable;
use Overcollector\Dao\SettingsTable;
use Overcollector\Dao\CosmeticsTable;

function updateSession()
{
    if (isUserLoggedIn()) {
        $_SESSION["needrefresh"] = false;
        $_SESSION["heroes"] = HeroesTable::getInstance()->getAllHeroesSortById();
        $_SESSION["categories"] = CategoriesTable::getInstance()->getAllCategoriesSortById();
        $_SESSION["types"] = TypesTable::getInstance()->getAllTypesSortById();
        $_SESSION["settings"] = SettingsTable::getInstance()->getAllSettings();
        $_SESSION["user"]->setCosmetics(CosmeticsTable::getInstance()->getOwnedCosmeticsByUserId($_SESSION["user"]->getId()));
        $_SESSION["allcosmetics"] = CosmeticsTable::getInstance()->getAllCosmeticsByUserIdSortByHeroesAndType($_SESSION["user"]->getId());
        $_SESSION["cosmetics"] = CosmeticsTable::getInstance()->getCosmeticsByUserIdSortByHeroesAndType($_SESSION["user"]->getId());
        return true;
    }
    return false;
}
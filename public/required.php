<?php

require_once(__DIR__ . "/../vendor/autoload.php");
session_start();

define("DEBUG", true);
define("LOCALHOST", true);

if (DEBUG) {
    ini_set("display_errors", DEBUG);
    ini_set("display_startup_errors", DEBUG);
    error_reporting(E_ALL);
}

require_once(__DIR__ . "/functions.php");

use \Overwatch\Dao\UsersTable;
use \Overwatch\Dao\CharactersTable;
use \Overwatch\Dao\TypesTable;
use \Overwatch\Dao\CosmeticsTable;

if (!isUserLoggedIn()) {
    $_SESSION["user"] = UsersTable::getInstance()->getUserByName("Tititesouris");
    $_SESSION["user"]->setCosmetics(CosmeticsTable::getInstance()->getCosmeticsByUserId($_SESSION["user"]->getId()));
    $_SESSION["characters"] = CharactersTable::getInstance()->getAllCharactersOrderById();
    $_SESSION["types"] = TypesTable::getInstance()->getAllTypesOrderById();
    $_SESSION["cosmetics"] = CosmeticsTable::getInstance()->getAllCosmeticsOrderByCharactersAndType();
}

//echo '<pre>' . var_export($_SESSION, true) . '</pre>';


// Twig
$loader = new Twig_Loader_Filesystem(__DIR__ . "/templates");
$twig = new Twig_Environment($loader, array(
    "debug" => DEBUG,
    "strict_variables" => DEBUG
));
$twig->addExtension(new Twig_Extension_Debug());
$twig->addFilter(new Twig_SimpleFilter("breverynword", function ($string, $n) {
    $words = 1;
    $result = "";
    for ($i = 0; $i < strlen($string); $i++) {
        $result .= $string[$i];
        if ($string[$i] === " ")
            $words++;
        if ($words === $n) {
            $result .= "<br/>";
            $words = 0;
        }
    }
    return $result;
}, array(
    "is_safe" => array("html")
)));
$twig->addGlobal("SESSION", $_SESSION);
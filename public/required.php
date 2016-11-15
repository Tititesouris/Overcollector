<?php
require_once(__DIR__ . "/../vendor/autoload.php");
session_start();

$config = parse_ini_file(__DIR__ . "/../overcollector.ini", true);
$debug = $config["config"]["debug"];

ini_set("display_errors", $debug);
ini_set("display_startup_errors", $debug);
if ($debug) {
    error_reporting(E_ALL);
}

require_once(__DIR__ . "/functions.php");

use Overcollector\Dao\UsersTable;

$_SESSION["needrefresh"] = false;
if (!isUserLoggedIn()) {
    //$_SESSION["user"] = UsersTable::getInstance()->getUserByName("Tititesouris");
    //$_SESSION["needrefresh"] = true;
}
if ($_SESSION["needrefresh"]) {
    updateSession();
}
//echo '<pre>' . var_export($_SESSION, true) . '</pre>';


// Twig
$loader = new Twig_Loader_Filesystem(__DIR__ . "/templates");
$twig = new Twig_Environment($loader, array(
    "debug" => $debug,
    "strict_variables" => $debug
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
$twig->addFilter(new Twig_SimpleFilter("colorgradient", function ($ratio, $format) {
    $gradient = array(
        floor(min(255, 510 - $ratio * 450)),
        floor(min(255, $ratio * 510)),
        0,
        0.25
    );
    if ($format === "rgba")
        return "rgba(" . $gradient[0] . ", " . $gradient[1] . ", " . $gradient[2] . ", " . $gradient[3] . ")";
    return $gradient;
}));
$twig->addGlobal("SESSION", $_SESSION);
$twig->addGlobal("GET", $_GET);
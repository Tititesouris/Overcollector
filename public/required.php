<?php
require_once(__DIR__ . "/../vendor/autoload.php");


$config = parse_ini_file(__DIR__ . "/../overcollector.ini", true);
$debug = $config["config"]["debug"];
$maintenance = $config["config"]["maintenance"];

ini_set("display_errors", $debug);
ini_set("display_startup_errors", $debug);
if ($debug) {
    error_reporting(E_ALL);
}
ini_set("session.gc_maxlifetime", 75000);

// Twig
$loader = new Twig_Loader_Filesystem(__DIR__ . "/templates");
$twig = new Twig_Environment($loader, [
    "debug" => $debug,
    "strict_variables" => $debug
]);
$twig->addExtension(new Twig_Extension_Debug());
$twig->addExtension(new Twig_Extensions_Extension_Date());

if ($maintenance) {
    $maintenanceConfig = parse_ini_file(__DIR__ . "/../maintenance.ini", true);
    echo $twig->render("maintenance.twig", $maintenanceConfig);
    die();
}

session_start();

require_once(__DIR__ . "/functions.php");

if (!isset($_SESSION["refreshglobal"])) {
    $_SESSION["refreshglobal"] = true;
}
updateGlobalSession();
if (isUserLoggedIn()) {
    updateUserSession();
}

$twig->addFilter(new Twig_SimpleFilter("pushObj", function ($object, $key, $value) {
    $object[$key] = $value;
    return $object;
}));
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
}, [
    "is_safe" => ["html"]
]));
$twig->addFilter(new Twig_SimpleFilter("colorgradient", function ($ratio, $format) {
    $gradient = [
        floor(min(255, 510 - $ratio * 450)),
        floor(min(255, $ratio * 510)),
        0,
        0.25
    ];
    if ($format === "rgba")
        return "rgba(" . $gradient[0] . ", " . $gradient[1] . ", " . $gradient[2] . ", " . $gradient[3] . ")";
    return $gradient;
}));

$twig->addGlobal("USERLOGGEDIN", isUserLoggedIn());
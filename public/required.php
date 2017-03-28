<?php
use Overcollector\Services\TokensService;
use Overcollector\Services\UsersService;

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


// Auto log in

$battlenet = $config["battlenet"];

if (!isUserLoggedIn() && isset($_SESSION["region"])) {
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
}
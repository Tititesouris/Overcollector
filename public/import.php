<?php
require_once("required.php");

use Overcollector\Services\UserCosmeticsService;
header('HTTP/1.1 201 Created');

if (isUserLoggedIn()) {
    if (isset($_POST["data"])) {
        $data = json_decode($_POST["data"], true);
        if ($data) {
            $cosmetics = [];
            switch ($data["version"]) {
                case "1.0":
                    $cosmetics = $data["cosmetics"];
                    break;
            }
            if (count($cosmetics) > 0) {
                if (UserCosmeticsService::setUserCosmeticsByUserId($_SESSION["user"]->getId(), $cosmetics)) {
                    $_SESSION["user"]->setCosmetics(UserCosmeticsService::getUserCosmeticsByUserId($_SESSION["user"]->getId()));
                    echo "true";
                    die();
                }
            }
        }
    }
}
echo "false";
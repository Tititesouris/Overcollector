<?php
require_once("required.php");

use Overcollector\Services\UserCosmeticsService;

if (isUserLoggedIn()) {
    if (isset($_POST["cosmetics"])) {
        $result = UserCosmeticsService::addUserCosmetics($_SESSION["user"]->getId(), $_POST["cosmetics"]);
        if ($result) {
            $_SESSION["user"]->setCosmetics(UserCosmeticsService::getUserCosmeticsByUserId($_SESSION["user"]->getId()));
            echo "true";
            die();
        }
    } else if (isset($_POST["cosmetic"]) && isset($_POST["owned"])) {
        if ($_POST["owned"] === "true") {
            $result = UserCosmeticsService::addUserCosmetic($_SESSION["user"]->getId(), $_POST["cosmetic"]);
            if ($result) {
                $_SESSION["user"]->addCosmetic($_POST["cosmetic"]);
                echo "true";
                die();
            }
        } else {
            $result = UserCosmeticsService::removeUserCosmetic($_SESSION["user"]->getId(), $_POST["cosmetic"]);
            if ($result) {
                $_SESSION["user"]->removeCosmetic($_POST["cosmetic"]);
                echo "true";
                die();
            }
        }
    }
}
echo "false";
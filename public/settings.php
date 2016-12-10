<?php
require_once("required.php");

use Overcollector\Services\UserSettingsService;

if (isUserLoggedIn()) {
    if (isset($_POST["setting"]) && isset($_POST["value"])) {
        $success = UserSettingsService::addUserSetting($_SESSION["user"]->getId(), $_POST["setting"], $_POST["value"]);
        if ($success) {
            $_SESSION["user"]->addSetting(UserSettingsService::getUserSetting($_SESSION["user"]->getId(), $_POST["setting"]));
            echo "true";
            die();
        }
    }
}
echo "false";
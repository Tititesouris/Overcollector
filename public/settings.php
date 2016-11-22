<?php
require_once("required.php");

use Overcollector\Dao\SettingsTable;

if (isUserLoggedIn()) {
    if (isset($_POST["setting"]) && isset($_POST["value"])) {
        $setting = SettingsTable::getInstance()->setUserSetting($_SESSION["user"]->getId(), $_POST["setting"], $_POST["value"]);
        if ($setting !== null) {
            $_SESSION["user"]->setSetting($setting);
            $_SESSION["needrefresh"] = true;
            echo true;
        }
        echo false;
    }
}
echo false;
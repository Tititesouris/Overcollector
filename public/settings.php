<?php
require_once("required.php");

use Overcollector\Dao\SettingsTable;

if (isUserLoggedIn()) {
    if (isset($_POST["setting"]) && isset($_POST["value"])) {
        $_SESSION["user"]->setSetting(SettingsTable::getInstance()->setUserSetting($_SESSION["user"]->getId(), $_POST["setting"], $_POST["value"]));
        $_SESSION["needrefresh"] = true;
        echo true;
    }
}
echo false;
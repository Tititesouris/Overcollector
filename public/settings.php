<?php
require_once("required.php");

use \Overwatch\Dao\SettingsTable;
use \Overwatch\Dao\CosmeticsTable;

if (isUserLoggedIn()) {
    if (isset($_POST["setting"]) && isset($_POST["value"])) {
        $_SESSION["user"]->setSetting(SettingsTable::getInstance()->setUserSetting($_SESSION["user"]->getId(), $_POST["setting"], $_POST["value"]));
        $_SESSION["cosmetics"] = CosmeticsTable::getInstance()->getAllCosmeticsOrderByHeroesAndType();
        echo true;
    }
}
echo false;
<?php
require_once("required.php");

use \Overwatch\Dao\SettingsTable;
use \Overwatch\Dao\CosmeticsTable;

if (isUserLoggedIn()) {
    if (isset($_POST["setting"]) && isset($_POST["value"])) {
        $_SESSION["user"]->setSetting(SettingsTable::getInstance()->setUserSetting($_SESSION["user"]->getId(), $_POST["setting"], $_POST["value"]));
        $_SESSION["allcosmetics"] = CosmeticsTable::getInstance()->getAllCosmeticsByUserIdSortByHeroesAndType($_SESSION["user"]->getId());
        $_SESSION["cosmetics"] = CosmeticsTable::getInstance()->getCosmeticsByUserIdSortByHeroesAndType($_SESSION["user"]->getId());
        echo true;
    }
}
echo false;
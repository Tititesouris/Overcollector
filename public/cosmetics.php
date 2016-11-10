<?php
require_once("required.php");

use \Overwatch\Dao\UsersTable;
use \Overwatch\Dao\CosmeticsTable;

if (isUserLoggedIn()) {
    if (isset($_POST["cosmetics"])) {
        if (UsersTable::getInstance()->updateCosmetics($_SESSION["user"]->getId(), $_POST["cosmetics"])) {
            $_SESSION["user"]->setCosmetics(CosmeticsTable::getInstance()->getCosmeticsByUserId($_SESSION["user"]->getId()));
            echo true;
        }
    }
}
echo false;
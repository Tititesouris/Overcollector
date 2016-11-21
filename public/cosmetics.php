<?php
require_once("required.php");

use Overcollector\Dao\UsersTable;

if (isUserLoggedIn()) {
    if (isset($_POST["cosmetic"]) && isset($_POST["owned"])) {
        if (UsersTable::getInstance()->updateUserCosmetic($_SESSION["user"]->getId(), $_POST["cosmetic"], $_POST["owned"] === "true")) {
            $_SESSION["needrefresh"] = true;
            echo true;
        }
    }
}
echo false;
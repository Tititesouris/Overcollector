<?php
require_once("required.php");

use Overcollector\Dao\CosmeticsTable;

if (isUserLoggedIn()) {
    if (isset($_POST["cosmetic"]) && isset($_POST["owned"])) {
        $result = CosmeticsTable::getInstance()->updateUserCosmetic($_SESSION["user"]->getId(), $_POST["cosmetic"], $_POST["owned"] === "true");
        if ($result !== null) {
            if (gettype($result) === "string") {
                $_SESSION["user"]->removeCosmetic($result);
            }
            else {
                $_SESSION["user"]->addCosmetic($result);
            }
            echo true;
        }
    }
}
echo false;
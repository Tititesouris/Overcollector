<?php
require_once("required.php");

use Overwatch\Dao\UsersTable;

if (isUserLoggedIn()) {
    if (isset($_POST["data"])) {
        $data = json_decode($_POST["data"], true);
        if ($data) {
            if ($data["version"] === "0.1") {
                $cosmetics = [];
                foreach ($data["cosmetics"] as $cosmetic) {
                    $cosmetics[] = $cosmetic["id"];
                }
                if (count($cosmetics) > 0) {
                    if (UsersTable::getInstance()->updateAllCosmetics($_SESSION["user"]->getId(), $cosmetics)) {
                        $_SESSION["needrefresh"] = true;
                        echo true;
                    }
                }
            }
        }
    }
}
echo false;
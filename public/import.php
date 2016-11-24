<?php
require_once("required.php");

use Overcollector\Dao\UsersTable;

if (isUserLoggedIn()) {
    if (isset($_POST["data"])) {
        $data = json_decode($_POST["data"], true);
        if ($data) {
            $cosmetics = [];
            if ($data["version"] === "0.1") {
                foreach ($data["cosmetics"] as $cosmetic) {
                    $cosmetics[] = $cosmetic["id"];
                }
            } else if ($data["version"] === "0.11") {
                $cosmetics = $data["cosmetics"];
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
echo false;
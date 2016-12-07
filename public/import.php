<?php
require_once("required.php");

use Overcollector\Dao\UsersTable;

if (isUserLoggedIn()) {
    if (isset($_POST["data"])) {
        $data = json_decode($_POST["data"], true);
        if ($data) {
            $cosmetics = [];
            switch ($data["version"]) {
                case "1.0":
                    $cosmetics = $data["cosmetics"];
                    break;
            }
            if (count($cosmetics) > 0) {
                if (UsersTable::getInstance()->updateAllCosmetics($_SESSION["user"]->getId(), $cosmetics)) {
                    $_SESSION["refreshalldata"] = true;
                    echo true;
                }
            }
        }
    }
}
echo false;
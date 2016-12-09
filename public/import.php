<?php
require_once("required.php");

use Overcollector\Dao\CosmeticsTable;

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
                if (CosmeticsTable::getInstance()->setUserCosmetics($_SESSION["user"]->getId(), $cosmetics)) {
                    $_SESSION["refreshuser"] = true;
                    echo true;
                }
            }
        }
    }
}
echo false;
<?php
require_once("required.php");

use Overcollector\Dao\CosmeticsTable;

if (isUserLoggedIn()) {
    header("Content-disposition: attachment; filename=export.json");
    header("Content-type: application/json");
    $cosmetics = CosmeticsTable::getInstance()->getOwnedCosmeticsByUserId($_SESSION["user"]->getId());
    $cosmeticIds = [];
    foreach ($cosmetics as $cosmetic) {
        $cosmeticIds[] = $cosmetic->getId();
    }
    $export = [
        "version" => "1.0",
        "cosmetics" => $cosmeticIds
    ];
    echo json_encode($export);
}
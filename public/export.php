<?php
require_once("required.php");

use Overcollector\Services\UserCosmeticsService;

if (isUserLoggedIn()) {
    header("Content-disposition: attachment; filename=export.json");
    header("Content-type: application/json");
    $cosmetics = UserCosmeticsService::getUserCosmeticsByUserId($_SESSION["user"]->getId());
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
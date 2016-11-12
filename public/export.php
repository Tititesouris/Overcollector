<?php
require_once("required.php");

use \Overwatch\Dao\CosmeticsTable;

if (isUserLoggedIn()) {
    header('Content-disposition: attachment; filename=export.json');
    header('Content-type: application/json');
    $export = [
        "version" => "0.1",
        "cosmetics" => CosmeticsTable::getInstance()->getAllOwnedCosmeticsByUserId($_SESSION["user"]->getId())
    ];
    echo json_encode($export);
}
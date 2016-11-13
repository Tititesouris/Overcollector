<?php
function isUserLoggedIn()
{
    return isset($_SESSION["user"]);
}

function stupidBoolVal($boolean)
{
    return $boolean ? "true" : "false";
}

use Overcollector\Dao\HeroesTable;
use Overcollector\Dao\CategoriesTable;
use Overcollector\Dao\TypesTable;
use Overcollector\Dao\CosmeticsTable;

function updateSession()
{
    if (isUserLoggedIn()) {
        $_SESSION["needrefresh"] = false;
        $_SESSION["heroes"] = HeroesTable::getInstance()->getAllHeroesSortById();
        $_SESSION["categories"] = CategoriesTable::getInstance()->getAllCategoriesSortById();
        $_SESSION["types"] = TypesTable::getInstance()->getAllTypesSortById();
        $_SESSION["user"]->setCosmetics(CosmeticsTable::getInstance()->getOwnedCosmeticsByUserId($_SESSION["user"]->getId()));
        $_SESSION["allcosmetics"] = CosmeticsTable::getInstance()->getAllCosmeticsByUserIdSortByHeroesAndType($_SESSION["user"]->getId());
        $_SESSION["cosmetics"] = CosmeticsTable::getInstance()->getCosmeticsByUserIdSortByHeroesAndType($_SESSION["user"]->getId());
        return true;
    }
    return false;
}
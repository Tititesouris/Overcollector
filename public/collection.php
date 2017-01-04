<?php
require_once("required.php");
if (isUserLoggedIn()) {

    $user = $_SESSION["user"];

    $pages = [
        "current" => isset($_GET["page"]) ? $_GET["page"] : 0,
        "start" => (isset($_GET["page"]) ? $_GET["page"] : 0) * $user->getSettings()["collection-heroes-per-page"]->getValue(),
        "end" => ((isset($_GET["page"]) ? $_GET["page"] : 0) + 1) * $user->getSettings()["collection-heroes-per-page"]->getValue()
    ];

    $stats = [
        "owned" => 0,
        "total" => 0,
        "ownedCredits" => 0,
        "totalCredits" => 0,
        "heroes" => [],
        "categories" => [],
        "types" => [],
        "heroesTypes" => []
    ];

    foreach ($user->filterCosmeticsByUserSettings($_SESSION["cosmetics"], true) as $id => $cosmetic) {
        // Initialize

        // Group all Player Icons together if the setting is enabled
        if ($cosmetic->getType()->getId() === 1 && $user->getSettings()["collection-show-all-playericons-in-allheroes"]->getValue()) {
            $heroId = 0;
        } else {
            $heroId = $cosmetic->getHero() !== null ? $cosmetic->getHero()->getId() : 0;
        }
        $categoryId = $cosmetic->getCategory() !== null ? $cosmetic->getCategory()->getId() : 0;
        $typeId = $cosmetic->getType()->getId();
        if (!isset($stats["heroes"][$heroId])) {
            $stats["heroes"][$heroId] = [
                "owned" => 0,
                "total" => 0,
                "ownedCredits" => 0,
                "totalCredits" => 0
            ];
        }
        if (!isset($stats["categories"][$categoryId])) {
            $stats["categories"][$categoryId] = [
                "owned" => 0,
                "total" => 0,
                "ownedCredits" => 0,
                "totalCredits" => 0
            ];
        }
        if (!isset($stats["types"][$typeId])) {
            $stats["types"][$typeId] = [
                "owned" => 0,
                "total" => 0,
                "ownedCredits" => 0,
                "totalCredits" => 0
            ];
        }
        if (!isset($stats["heroesTypes"][$heroId][$typeId])) {
            $stats["heroesTypes"][$heroId][$typeId] = [
                "owned" => 0,
                "total" => 0,
                "ownedCredits" => 0,
                "totalCredits" => 0
            ];
        }

        // Add to totals
        $stats["total"]++;
        $stats["heroes"][$heroId]["total"]++;
        $stats["categories"][$categoryId]["total"]++;
        $stats["types"][$typeId]["total"]++;
        $stats["heroesTypes"][$heroId][$typeId]["total"]++;
        // Player Icons cannot be purchased and if the rarity or the category is null the price is null
        if ($cosmetic->getType()->getId() !== 1 && $cosmetic->getRarity() !== null && $cosmetic->getCategory() !== null) {
            $price = $cosmetic->getPrice();
            $stats["totalCredits"] += $price;
            $stats["heroes"][$heroId]["totalCredits"] += $price;
            $stats["categories"][$categoryId]["totalCredits"] += $price;
            $stats["types"][$typeId]["totalCredits"] += $price;
            $stats["heroesTypes"][$heroId][$typeId]["totalCredits"] += $price;
        }

        // Add to owned
        if ($user->hasCosmetic($cosmetic->getId())) {
            $stats["owned"]++;
            $stats["heroes"][$heroId]["owned"]++;
            $stats["categories"][$categoryId]["owned"]++;
            $stats["types"][$typeId]["owned"]++;
            $stats["heroesTypes"][$heroId][$typeId]["owned"]++;

            // Player Icons cannot be purchased and if the rarity or the category is null the price is null
            if (isset($price)) {
                $stats["ownedCredits"] += $price;
                $stats["heroes"][$heroId]["ownedCredits"] += $price;
                $stats["categories"][$categoryId]["ownedCredits"] += $price;
                $stats["types"][$typeId]["ownedCredits"] += $price;
                $stats["heroesTypes"][$heroId][$typeId]["ownedCredits"] += $price;
            }
        }
    }

    $filteredCosmetics = $user->filterCosmeticsByUserSettings($_SESSION["cosmetics"]);

    echo $twig->render("collection.twig", [
        "HEROES" => $_SESSION["heroes"],
        "CATEGORIES" => $_SESSION["categories"],
        "TYPES" => $_SESSION["types"],
        "COSMETICS" => $_SESSION["cosmetics"],
        "USER" => $user,
        "USERCOSMETICS" => $user->getCosmetics(),
        "USERSETTINGS" => $user->getSettings(),
        "FILTEREDCOSMETICS" => $filteredCosmetics,
        "FILTEREDUSERCOSMETICS" => $user->filterCosmeticsByUserSettings($user->getCosmetics()),
        "SORTEDFILTEREDCOSMETICS" => $user->sortCosmeticsByHeroesAndTypes($filteredCosmetics),
        "PAGES" => $pages,
        "STATS" => $stats
    ]);
} else {
    header("Location: ./login.php");
}
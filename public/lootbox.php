<?php
require_once("required.php");
if (isUserLoggedIn()) {
    echo $twig->render("lootbox.twig", [
        "USER" => $_SESSION["user"],
        "HEROES" => $_SESSION["heroes"],
        "TYPES" => $_SESSION["types"],
        "COSMETICS" => $_SESSION["cosmetics"],
        "USERSETTINGS" => $_SESSION["user"]->getSettings()
    ]);
}
else {
    header("Location: ./login.php");
}
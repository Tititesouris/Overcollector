<?php
require_once("required.php");
if (isUserLoggedIn()) {
    echo $twig->render("profile.twig", [
        "SETTINGS" => $_SESSION["settings"],
        "USERSETTINGS" => $_SESSION["user"]->getSettings()
    ]);
} else {
    header("Location: ./login.php");
}
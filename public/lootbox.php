<?php
require_once("required.php");
if (isUserLoggedIn()) {
    echo $twig->render("lootbox.twig");
}
else {
    header("Location: ./login.php");
}
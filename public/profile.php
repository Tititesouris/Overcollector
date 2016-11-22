<?php
require_once("required.php");
if (isUserLoggedIn()) {
    echo $twig->render("profile.twig");
} else {
    header("Location: ./login.php");
}
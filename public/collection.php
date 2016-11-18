<?php
require_once("required.php");
if (isUserLoggedIn()) {
    echo $twig->render("collection.twig");
}
else {
    header("Location: ./login.php");
}
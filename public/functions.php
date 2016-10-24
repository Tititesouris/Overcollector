<?php
function sendPost($url, $params)
{
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array("Accept: application/json"));
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
    $response = curl_exec($ch);
    if (DEBUG) {
        if ($errno = curl_errno($ch)) {
            $error_message = curl_strerror($errno);
            echo "cURL error ({$errno}): {$error_message}";
        }
    }
    return $response;
}

function sendGet($url, $params)
{
    $ch = curl_init(($params !== null) ? $url . "?" . http_build_query($params) : $url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array("Accept: application/json"));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    return $response;
}

function isUserLoggedIn()
{
    return isset($_SESSION["user"]);
}

function stupidBoolVal($boolean)
{
    return $boolean ? "true" : "false";
}
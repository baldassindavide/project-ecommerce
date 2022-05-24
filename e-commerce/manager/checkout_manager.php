<?php
include("../connection.php");
session_start();

if (!isset($_COOKIE["logged_in"]))
    header("location:../payment_login.php");
else {

    if (isset($_GET["price"]))
        $price = $_GET["price"];

    if (isset($_COOKIE["current_cart"]))
        $current_cart = $_COOKIE["current_cart"];

    $delivery_type = "standard";

    $sql = $conn->prepare("INSERT INTO user_order (delivery_type,total_price,cart_ID) values (?,?,?)");
    $sql->bind_param("sdi", $delivery_type, $price, $current_cart);

    if ($sql->execute() === TRUE) {
        header("location:../order.php?");
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

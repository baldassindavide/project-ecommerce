<?php
include("../connection.php");
session_start();

$item_ID = "";

if(isset($_GET["item_ID"])){
    $item_ID = $_GET["item_ID"];
}

$cart_ID= $_COOKIE["current_cart"];

$sql = $conn->prepare("DELETE FROM contains WHERE item_ID = ? AND cart_ID = ?");
$sql->bind_param("ii",$item_ID,$cart_ID);

if ($sql->execute() === TRUE) {
    header("location:../cart.php?msg=item-removed");
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

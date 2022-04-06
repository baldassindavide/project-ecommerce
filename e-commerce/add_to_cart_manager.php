<?php
include("connection.php");
session_start();

if(isset($_GET["itemID"]))
    $item_ID = $_GET["itemID"];

$cart_ID = $_COOKIE["current_cart"];
$amount = 1;

    $sql = $conn->prepare("INSERT INTO contains (cart_ID,item_ID,amount) VALUES (?, ?, ?)");
    $sql->bind_param("iii", $cart_ID, $item_ID, $amount);

    if ($sql->execute() === TRUE) 
        header("location:index.php?msg=added-to-cart");
     else 
        echo "Error: " . $sql . "<br>" . $conn->error;
?>
<?php
include("../connection.php");
session_start();

if (isset($_GET["itemID"]))
    $item_ID = $_GET["itemID"];

$cart_ID = $_COOKIE["current_cart"];

if (isset($_GET["amount"]))
    $amount = $_GET["amount"];

$sql_variable = "";

$sql_check_exist = "SELECT ID,amount FROM contains WHERE cart_ID = $cart_ID AND item_ID = $item_ID"; // check if the same item is already in the cart
$result = $conn->query($sql_check_exist);



if ($result->num_rows > 0) { // if the item is already in the cart, update the amount
    $row = $result->fetch_assoc();
    $tot_amount = $row["amount"] + $amount;

    $sql_variable = $conn->prepare("UPDATE contains SET amount = $tot_amount WHERE cart_ID = $cart_ID AND item_ID = $item_ID");
}
else {
    $sql_variable = $conn->prepare("INSERT INTO contains (cart_ID, item_ID, amount) VALUES ($cart_ID, $item_ID, $amount)");
}

if ($sql_variable->execute() === TRUE) {
    header("location:../index.php?msg=added-to-cart");
} else {
    echo var_dump($sql);
    echo "Error: " . $sql . "<br>" . $conn->error;
}

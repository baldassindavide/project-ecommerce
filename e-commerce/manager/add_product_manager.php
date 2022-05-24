<?php
include("../connection.php");
session_start();

if (isset($_POST["item_name"]))
    $item_name = $_POST["item_name"];

if (isset($_POST["item_description"]))
    $item_description = $_POST["item_description"];

if (isset($_POST["item_price"]))
    $item_price = $_POST["item_price"];

if (isset($_POST["item_stock_amount"]))
    $item_stock_amount = $_POST["item_stock_amount"];

if (isset($_POST["item_category"]))
    $item_category = $_POST["item_category"];

$sql = $conn->prepare("INSERT INTO item (name,description,price,stock_amount,category_ID) VALUES (?, ?, ?, ?, ?)");
$sql->bind_param("sssds", $item_name, $item_description, $item_price, $item_stock_amount, $item_category);

if ($sql->execute() === TRUE) {
    header("location:../index.php?msg=item-added");
} else {
    var_dump($sql);
    echo "Error: " . $sql . "<br>" . $conn->error;
}

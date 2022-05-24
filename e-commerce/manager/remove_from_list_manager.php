<?php
include("../connection.php");

$item_ID = $_GET["itemID"];

$sql = $conn->prepare("DELETE FROM item WHERE ID = " . $item_ID);

if ($sql->execute() === TRUE) {
    header("location:../index.php?msg=item_removed");
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

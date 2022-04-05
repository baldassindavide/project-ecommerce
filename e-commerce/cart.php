<?php
include("connection.php");
session_start();


$sql = "INSERT INTO cart (price, creation_date, user_ID) VALUES "; // base query

if (isset($_COOKIE["current_cart"])) // if a cart already exists
    $x = 1;
else { // else create a new one
    if (isset($_COOKIE["logged_in"])) { // if a cart already exists and it is associated with a user
        $user_ID = $_SESSION["user_ID"];
        $sql .= "(0, CURRENT_TIMESTAMP, $user_ID)"; // create a cart associated with that user
    } else
        $sql .= "(0, CURRENT_TIMESTAMP, 6)"; // create an anonimous cart


    $conn->query($sql); // inserts the cart

    $sql = "SELECT ID FROM cart ORDER BY ID DESC LIMIT 1";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            setcookie("current_cart", $row["ID"], time() + (86400 * 1), "/");
        }
    }
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <title>Cart</title>
</head>

<body>
    <button onclick="deleteCart()" class="btn btn-danger">Elimina carrello</button>

</body>

</html>

<script>
    function deleteCart() {
        window.location = "delete_cart_manager.php";
    }
</script>
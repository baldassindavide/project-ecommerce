<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- BOOTSTRAP -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <title>Payment</title>
</head>

<body>
    <h1>Total: </h1>
    <?php
    if (isset($_COOKIE["current_cart"]))
        $current_cart = $_COOKIE["current_cart"];

    // makes the total of the order
    $sql = "SELECT SUM(price) as total FROM item INNER JOIN contains ON item.ID = contains.item_ID WHERE contains.cart_ID = " . $current_cart;

    $result = $conn->query($sql);
    if ($result->num_rows > 0) { // if it finds a correspondence
        while ($row = $result->fetch_assoc()) {
            echo $row["total"];
        }
    }
    ?>
</body>

</html>
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
    <title>e-Commerce</title>
</head>

<body>
    <button onclick="toLogin()" class="btn btn-primary">Login</button>
    <!-- VISUALIZE ALL PRODUCTS -->
    <div class="container">
        <div class="row">
                <div class="col">
                    uno<br><img src="uploads/libro-geronimo-stilton.jpg" width="200" height="200">
                </div>
            <div class="col">
                due<br><img src="uploads/libro-geronimo-stilton.jpg" width="200" height="200">
            </div>
            <div class="col">tre</div>
        </div>

        <?php

        $sql = "SELECT ID,name,description,price,image FROM item";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) { // if it finds a correspondence
            while ($row = $result->fetch_assoc()) {
                echo "<div class='row'><div class='col'>" . $row["name"] . "<br><img src='uploads/" . $row["image"] . "'><br>"; //name and image
                echo $row["price"]."€";
                echo "</div>";
                echo "<div class='row'><div class='col'>" . $row["name"] . "<br><img src='uploads/" . $row["image"] . "'><br>"; //name and image
                echo $row["price"]."€";
                echo "</div></div>";
            }
        }

        ?>
    </div>
</body>

</html>

<script>
    function toLogin() {
        window.location = "login.php";
    }
</script>

<style>
    img {
        width: 200px;
        height: 200px;
    }
</style>
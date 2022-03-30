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
    <title>e-Commerce</title>
</head>

<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Jean Monnetmazon</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class='dropdown-item' onclick="showOnlyACategory(1)" href='#'>SHOW ALL</a>
                        <?php // gets the category for the dropdown menu from the DB
                        $sql = "SELECT DISTINCT name FROM category";
                        $result = $conn->query($sql);
                        if ($result->num_rows > 0) { // if it finds a correspondence
                            while ($row = $result->fetch_assoc()) {
                                echo "<a class='dropdown-item' onclick=\"showOnlyACategory(" . "'" . $row["name"] . "'" . ")\" href='#'>" . $row["name"] . "</a>";
                            }
                        }

                        ?>
                    </div>
                </li>
            </ul>
        </div>
    </nav>


    <button onclick="toLogin()" class="btn btn-primary">Login</button>
    <!-- VISUALIZE ALL PRODUCTS -->
    <div class="container">
        <div class="row">


            <?php
            $col_index = 0;
            $items_per_row = 3;

            // filter by category
            $category = "";
            if (isset($_GET['category']))
                $category = "AND category.name = '" . $_GET['category'] . "'";
            else
                $category = "";

            $sql = "SELECT item.ID,item.name,item.description,price,image 
                    FROM item INNER JOIN category 
                    ON category.ID = item.category_ID WHERE 1 " . $category;

            // visualizes the items
            $result = $conn->query($sql);
            if ($result->num_rows > 0) { // if it finds a correspondence
                while ($row = $result->fetch_assoc()) {
                    if ($col_index >= $items_per_row) {
                        echo "</div><div class='row' >";
                        $col_index = 0;
                    }
                    echo "<div class='col border border-primary'>" . $row["name"] . "<br><img src='uploads/" . $row["image"] . "' class='rounded mx-auto d-block'><br>"; //name and image
                    echo $row["price"] . "€";
                    echo "</div>";
                    $col_index++;
                }
            }

            ?>
        </div>
    </div>
</body>

</html>

<script>
    function toLogin() {
        window.location = "login.php";
    }

    function showOnlyACategory(category) {
        if (category == 1)
            window.location = "index.php";
        else
            window.location = "index.php?category=" + category;
    }
</script>

<style>
    img {
        width: 200px;
        height: 200px;
    }
</style>
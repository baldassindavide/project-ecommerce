<?php
include("connection.php");
session_start();

if (!isset($_COOKIE["logged_in"]) && !isset($_COOKIE["current_cart"])) { // if you are not logged in and there isn't an existing cart opened
    $sql_create_anonimous = "INSERT INTO cart (price, creation_date, user_ID) VALUES (0, CURRENT_TIMESTAMP, 6)"; // 6 is the guest user ID
    $conn->query($sql_create_anonimous);

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
    <!-- BOOTSTRAP -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <title>Jean Monnetmazon</title>
</head>

<body>
    <!-- NAVBAR -->
    <section style='background-color: #eee;'>
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
                    <li class="nav-item">
                        <a class="nav-link" href="about_me.php">About me<span class="sr-only">(current)</span></a>
                    </li>

                </ul>
                <div class='text-center'>
                    <?php
                    if (isset($_COOKIE["logged_in"]))
                        echo "<h3>Welcome " . $_SESSION["username"] . "</h3>";
                    ?>
                </div>
            </div>

            <!-- BUTTONS -->
            <?php
            $user_ID = "";
            if(isset($_SESSION["user_ID"]))
                $user_ID = $_SESSION["user_ID"];
            // shows logout button only if logged in and vice versa
            if (isset($_COOKIE["logged_in"])){
                echo "<button onclick='toLogout()' class='btn btn-primary mr-3'>Logout</button>";
                echo "<button onclick='toProfilePage(".$user_ID.")' class='btn btn-primary mr-3'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-person' viewBox='0 0 16 16'>
                <path d='M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z'/>
                </svg></button>";
            }     
            else
                echo "<button onclick='toLogin()' class='btn btn-primary mr-3'>Login</button>";
            ?>
            <button onclick="toCart()" class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg></button>
        </nav>
        <!-- VISUALIZE ALL PRODUCTS -->

        <div class='container py-5'>
            <div class='row'>


                <?php
                $col_index = 0;
                $items_per_row = 3;

                // filter by category
                $category = "";
                if (isset($_GET['category']))
                    $category = "AND category.name = '" . $_GET['category'] . "'";
                else
                    $category = "";

                $sql = "SELECT item.ID,item.name,item.description,price,image,stock_amount 
                    FROM item INNER JOIN category 
                    ON category.ID = item.category_ID WHERE 1 " . $category;

                // visualizes the items
                $result = $conn->query($sql);
                if ($result->num_rows > 0) { // if it finds a correspondence
                    while ($row = $result->fetch_assoc()) {
                        if ($col_index >= $items_per_row) {
                            echo "</div></div></section>
                            <section style='background-color: #eee;'><div class='container py-5'><div class='row'>";
                            $col_index = 0;
                        }

                        echo "<div class='col-md-12 col-lg-4 mb-4 mb-lg-0'>
                        <div class='card'><div class='d-flex justify-content-between p-3'>
                        <p class='lead mb-0'>" . $row['name'] . "</p></div>
                        <div class='text-center'><img src='uploads/" . $row['image'] . "' class='rounded shadow-lg' alt='image' /></div>
                        <div class='card-body'><div class='d-flex justify-content-between mb-3'>
                        <h5 class='mb-0'>" . $row['name'] . "</h5>
                        <h5 class='text-dark mb-0'>€" . $row['price'] . "</h5>
                        </div><div class='d-flex justify-content-between mb-2'>
                        <p class='text-muted mb-0'>Available: <span class='fw-bold'>" . $row['stock_amount'] . "</span></p>
                        </div><button onclick='addToCart(" . $row["ID"] . ")' class='btn btn-primary mr-3'>Add to cart</button>Amount: <select class='form-select' id='combo_amount_".$row["ID"]."'><option value='1'>1</option>
                        <option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select>
                        </div></div></div>";
                        $col_index++;
                    }
                }

                ?>
            </div>
        </div>
    </section>
</body>

</html>

<script>
    function toLogin() {
        window.location = "login.php";
    }

    function toLogout() {
        window.location = "manager/logout_manager.php";
    }

    function toCart() {
        window.location = "cart.php";
    }

    function toProfilePage(user_ID){
        window.location = "profile_page.php?user_ID=" + user_ID;
    }
    function addToCart(item_ID) {
        var combo = document.getElementById('combo_amount_' + item_ID);
        var value = combo.options[combo.selectedIndex].value;
        window.location = "manager/add_to_cart_manager.php?itemID=" + item_ID + "&amount=" + value;
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
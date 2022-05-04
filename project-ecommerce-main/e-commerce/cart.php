<?php
include("connection.php");
session_start();

if (!isset($_COOKIE["logged_in"]) && !isset($_COOKIE["current_cart"])) { // if you are not logged in and there isn't an existing cart opened
    $sql_create_anonimous = "INSERT INTO cart (price, creation_date, user_ID) VALUES (0, CURRENT_TIMESTAMP, 6)"; // 6 is the guest user ID
    $conn->query($sql_create_anonimous);
} else if (isset($_COOKIE["logged_in"]) && !isset($_COOKIE["current_cart"])) { // if the user hasn't got a cart associated with him
    $user_ID = $_SESSION["user_ID"];
    $sql_loggedUser_cart = "SELECT ID from cart WHERE user_ID = $user_ID";
    $result = $conn->query($sql_loggedUser_cart);

    if ($result->num_rows > 0) { // it loads a cart if one associated with that user already exists
        while ($row = $result->fetch_assoc()) {
            echo $row["ID"];
        }
    } else { // else it creates a new one
        $user_ID = $_SESSION["user_ID"];
        $sql_create_anonimous = "INSERT INTO cart (price, creation_date, user_ID) VALUES (0, CURRENT_TIMESTAMP, $user_ID)"; // 6 is the guest user ID
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
    <script>
        function removeFromCart(item_ID){
            window.location = "manager/remove_from_cart_manager.php?item_ID=" + item_ID;
        }
    </script>
    <title>Cart</title>
</head>

<body>
    <h1 class="ml-5 my-7">Your Cart</h1>
    <div class="container-fluid">
        <div class="row">
            <aside class="col-lg-9">
                <div class="card">
                    <div class="table-responsive">
                        <table class="table table-borderless table-shopping-cart">
                            <thead class="text-muted">
                                <tr class="small text-uppercase">
                                    <th scope="col" width="200">Product</th>
                                    <th scope="col" width="120">Quantity</th>
                                    <th scope="col" width="120">Price</th>
                                    <th scope="col" width="200"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                // visualize the items in the current cart
                                $sql = "SELECT item.ID,item.name,item.description,item.price,item.image,contains.amount FROM contains INNER JOIN item
                                            ON contains.item_ID = item.ID 
                                            WHERE contains.cart_ID = " . $_COOKIE["current_cart"];
                                $result = $conn->query($sql);

                                if ($result->num_rows > 0) { // if it finds some items in the cart
                                    while ($row = $result->fetch_assoc()) {
                                        $totalPrice = $row['amount'] * $row['price'];
                                        echo "<tr><td><figure class='itemside align-items-center'>
                                            <div class='aside'><img src='uploads/" . $row['image'] . "' class='img-sm'></div>
                                            <figcaption class='info'> <a href='#' class='title text-dark' data-abc='true'><b>" . $row['name'] . "</b></a>
                                            </figure></td><td>" . $row['amount'] . "</td><td>
                                            <div class='price-wrap'> <var class='price'>€ " . $totalPrice . "</var><small class='text-muted'>€ " . $row['price'] . " each </small> </div>
                                            </td><td class='text-left '><button onclick='removeFromCart(" . $row['ID'] . ")' class='btn btn-light' data-abc='true'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash3' viewBox='0 0 16 16'>
                                            <path d='M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 
                                            0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z'/>
                                            </svg></button></td></tr>";
                                    }
                                } else
                                    echo "<tr><td><h1>Cart empty</h1></td>";
                                ?>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </aside>
            <aside class="col-lg-3">
                <div class="card mb-3">
                    <div class="card-body">
                        <form>
                            <div class="form-group"> <label>Have coupon?</label>
                                <div class="input-group"> <input type="text" class="form-control" name="" placeholder="Coupon code"><br> <br><button class="btn btn-primary btn-apply">Apply</button></div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <dl class="dlist-align">
                            <dt>Total price:</dt>
                            <dd class="text-right ml-3">€
                                <?php // calculates the total price

                                $sql = "SELECT SUM(item.price) as tot FROM contains INNER JOIN item
                                ON contains.item_ID = item.ID 
                                WHERE contains.cart_ID = " . $_COOKIE["current_cart"];;
                                $result = $conn->query($sql);
                                if ($result->num_rows > 0) { // if it finds some items in the cart
                                    while ($row = $result->fetch_assoc()) {
                                        echo number_format($row['tot'], 2, ',', '.');

                                        echo "</dd></dl>";
                                        echo "<dl class='dlist-align'>
                                        <dt>Discount:</dt>";

                                        // discount management
                                        $discountedPrice = (round($row['tot'], 2) / 100) * 10;

                                        if (isset($_SESSION["discount"]))
                                            echo "<dd class='text-right text-danger ml-3'>-€ " . number_format($discountedPrice, 2, ',', '.') . "</dd>";
                                        else
                                            echo "<dd class='text-right text-danger ml-3'>No discount applied</dd>"; // no discount applied

                                        // total price with discount
                                        echo "</dl><dl class='dlist-align'>
                                             <dt>Total:</dt>
                                             <dd class='text-right text-dark b ml-3'><strong>€ " . number_format((round($row['tot'], 1) - $discountedPrice), 2, ',', '.') . "</strong></dd></dl>";
                                    }
                                }
                                ?>

                                <hr> <a href="manager/checkout_manager.php  " class="btn btn-primary btn-main" data-abc="true"> Make Purchase </a> <a href="index.php" class="btn btn-success btn-square btn-main mt-2" data-abc="true">Continue Shopping</a>
                    </div>
                </div>
            </aside>
        </div>
    </div>

</body>

</html>

<!-- CSS -->
<style>
    @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

    body {
        background-color: #eeeeee;
        font-family: 'Open Sans', serif;
        font-size: 14px
    }

    .container-fluid {
        margin-top: 70px
    }

    .card-body {
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        padding: 1.40rem
    }

    .img-sm {
        width: 80px;
        height: 80px
    }

    .itemside .info {
        padding-left: 15px;
        padding-right: 7px
    }

    .table-shopping-cart .price-wrap {
        line-height: 1.2
    }

    .table-shopping-cart .price {
        font-weight: bold;
        margin-right: 5px;
        display: block
    }

    .text-muted {
        color: #969696 !important
    }

    a {
        text-decoration: none !important
    }

    .card {
        position: relative;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-direction: column;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid rgba(0, 0, 0, .125);
        border-radius: 0px
    }

    .itemside {
        position: relative;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        width: 100%
    }

    .dlist-align {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex
    }

    [class*="dlist-"] {
        margin-bottom: 5px
    }

    .coupon {
        border-radius: 1px
    }

    .price {
        font-weight: 600;
        color: #212529
    }

    .btn.btn-out {
        outline: 1px solid #fff;
        outline-offset: -5px
    }

    .btn-main {
        border-radius: 2px;
        text-transform: capitalize;
        font-size: 15px;
        padding: 10px 19px;
        cursor: pointer;
        color: #fff;
        width: 100%
    }

    .btn-light {
        color: #ffffff;
        background-color: #F44336;
        border-color: #f8f9fa;
        font-size: 12px
    }

    .btn-light:hover {
        color: #ffffff;
        background-color: #F44336;
        border-color: #F44336
    }

    .btn-apply {
        font-size: 11px
    }
</style>
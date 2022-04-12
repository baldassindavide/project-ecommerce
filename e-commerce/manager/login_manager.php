<?php
include("../connection.php");
session_start();

$username = $_POST["username"]; // get data from login page
$password = md5($_POST["password"]);

/*$sql = "SELECT user.ID,username,password,cart.ID as cart_ID FROM user JOIN cart
        ON cart.user_ID = user.ID 
        WHERE username = '$username' AND password='$password'"; // query to send to dbms*/
$sql = "SELECT user.ID,username,password FROM user
        WHERE username = '$username' AND password='$password'";

$result = $conn->query($sql);



if ($result->num_rows > 0) { // if it finds a correspondence
    while ($row = $result->fetch_assoc()) {
        $_SESSION["username"] = $row["username"];
        $_SESSION["user_ID"] = $row["ID"];

        setcookie("logged_in", true, time() + (86400 * 1), "/"); // set the cookie to logged in = true, else it sets the cookie to false
    }

    $sql_cart_ids = "";
    if (isset($_SESSION["user_ID"])) { // if the login is ok
        $sql_cart_ids = "SELECT ID as cart_ID FROM cart WHERE user_ID = " . $_SESSION["user_ID"];
        $result = $conn->query($sql_cart_ids);

        if ($result->num_rows > 0) { // if the user has already got a cart, it is opened
            while ($row = $result->fetch_assoc()) {
                setcookie("current_cart", $row["cart_ID"], time() + (86400 * 1), "/");
            }
        } else { // else it creates a cart and opens it
            $sql_create_guest_cart = "INSERT INTO cart (price, creation_date, user_ID) VALUES (0, CURRENT_TIMESTAMP, ".$_SESSION["user_ID"].")";
            $conn->query($sql_create_guest_cart); // inserts the cart

            $sql = "SELECT ID FROM cart ORDER BY ID DESC LIMIT 1";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    setcookie("current_cart", $row["ID"], time() + (86400 * 1), "/");
                }
            }
        }
    }
} else
    setcookie("logged_in", false, time() + (86400 * 1), "/");




header("location:../index.php");

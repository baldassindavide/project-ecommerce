<?php
include("connection.php");
session_start();

$username = $_POST["username"]; // get data from login page
$password = md5($_POST["password"]);

$sql = "SELECT ID,username,password FROM user 
        WHERE username = '$username' AND password='$password'"; // query to send to dbms
$result = $conn->query($sql);

if ($result->num_rows > 0) { // if it finds a correspondence
    while ($row = $result->fetch_assoc()) {
        $_SESSION["username"] = $row["username"];
        $_SESSION["user_ID"] = $row["ID"];
        setcookie("logged_in", true, time() + (86400 * 1), "/"); // set the cookie to logged in = true, else it sets the cookie to false
    }
}
else
    setcookie("logged_in", false, time() + (86400 * 1), "/"); 


header("location:index.php");
?>
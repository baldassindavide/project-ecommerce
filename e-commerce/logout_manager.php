<?php
$_SESSION["user_ID"] = 6; // guest
setcookie("logged_in", false, time() + (86400 * 1), "/"); // 86400 = 1 day
setcookie("current_cart", false, time() + (86400 * 1), "/");
header("location:index.php");

?>
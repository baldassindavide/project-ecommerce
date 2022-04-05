<?php
setcookie("logged_in", false, time() + (86400 * 1), "/"); // 86400 = 1 day
header("location:index.php");
?>
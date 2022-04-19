<?php
session_start();

if (!isset($_COOKIE["logged_in"]))
    header("location:../payment_login.php");
else
    header("location:../payment.php");

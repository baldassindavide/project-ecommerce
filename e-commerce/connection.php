<?php
$servername = "localhost";
$username = "davidebaldassin";
$password = "";
$dbname = "my_davidebaldassin";
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>
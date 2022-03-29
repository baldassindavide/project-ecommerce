<?php
include("connection.php");
session_start();



$username = $_POST["username"];
$password = md5($_POST["password"]);
$confirm_password = md5($_POST["confirm_password"]);
$email = $_POST["email"];
$name = $_POST["name"];
$surname = $_POST["surname"];
$birth_date = $_POST["birth_date"];

if (strcmp($password, $confirm_password) == 0) { // compare and returns 0 if they are the same
    $sql = $conn->prepare("INSERT INTO user (username,password,email,name,surname,birth_date) VALUES (?, ?, ?, ?, ?, ?)");
    $sql->bind_param("ssssss", $username, $password, $email, $name, $surname, $birth_date);

    if ($sql->execute() === TRUE) {
        header("location:index.php");
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
else{
    header("location:register.php?err=password-doesnt-match");
}

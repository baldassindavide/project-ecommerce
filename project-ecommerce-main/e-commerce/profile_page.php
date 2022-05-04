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
    <!-- SCRIPTS -->
    <script>
        function show_add_product() {
            var x = document.getElementById("div_add_a_product");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>
    <title>Your Profile</title>
</head>

<body class="ml-3 mt-5">
    <?php
    $user_ID = "";
    if (isset($_GET["user_ID"]))
        $user_ID = $_GET["user_ID"];

    $sql = "SELECT * FROM user WHERE ID = $user_ID";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) { // if it finds a correspondence
        while ($row = $result->fetch_assoc()) {
            if ($row["isAdmin"] == 1) {
                echo "<h3><i>Since you are an admin, you can</i> ";
                echo "<button class='btn btn-primary' onclick='show_add_product()'>Add a product</button>";
            }
            echo "<h1><b>Username: </b>" . $row["username"] . "</h1>";
            echo "<h1><b>E-Mail: </b>" . $row["email"] . "</h1>";
            echo "<h1><b>Name: </b>" . $row["name"] . "</h1>";
            echo "<h1><b>Last Name: </b>" . $row["surname"] . "</h1>";
            echo "<h1><b>Birthday: </b>" . $row["birth_date"] . "</h1>";
        }
    }
    ?>

    <a class="btn btn-primary" href="index.php">Back to Home</a><br>

    <div id="div_add_a_product" class="col-md-4">
        <br><label for="item_name" class="form-info">Item Name:</label>
        <input type="text" name="item_name" placeholder="Item name" class="form-control"><br>
        <br><label for="item_description" class="form-info">Item Description:</label>
        <input type="text" name="item_name" placeholder="Item description" class="form-control"><br>
        <br><label for="item_price" class="form-info">Item Price:</label>
        <input type="number" name="item_price" placeholder="Item Name" class="form-control"><br>
        <br><label for="item_stock_amount" class="form-info">Stock Amount:</label>
        <input type="number" name="item_stock_amount" placeholder="Stock amount" class="form-control"><br>
    </div>
</body>

</html>
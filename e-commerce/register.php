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
    <title>Sign up</title>
</head>

<body>
    <form action="register_manager.php" method="post">
        <?php
        if (isset($_GET["err"]))
            echo "<script type='text/javascript'>alert('" . $_GET['err'] . "');</script>";

        ?>
        <div class='d-flex justify-content-center my-5'>
            <fieldset class="border p-2">
                <legend class="w-auto">Sign up:</legend>
                Username: <input type="text" class="form-control" name="username"><br>
                Password: <input type="password" class="form-control" name="password"><br>
                Confirm password: <input type="password" class="form-control" name="confirm_password"><br>
                E-mail: <input type="email" class="form-control" name="email"><br>
                Name: <input type="text" class="form-control" name="name"><br>
                Surname: <input type="text" class="form-control" name="surname"><br>
                Birthday: <input type="date" class="form-control" name="birth_date"><br>
                <input type="submit" value="Sign up" class="btn btn-primary"><br><br>
                <a href="index.php">Back to login</a>
            </fieldset>
        </div>
    </form>
</body>

</html>
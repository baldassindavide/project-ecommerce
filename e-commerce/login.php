<?php
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
    <title>Login</title>
</head>

<body>
    <br>
    <form action="manager/login_manager.php" method="post">
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <fieldset class="border p-2">
                                <legend class="w-auto">Login:</legend>
                                <label for="username" class="form-info">Username:</label>
                                <input type="text" name="username" placeholder="Username" class="form-control"><br>
                                <label for="password" class="form-info">Password: </label>
                                <input type="password" name="password" placeholder="Password" class="form-control"><br>
                                <input type="submit" value="Sign in" id="button_submit" class="btn btn-primary">
                                <a href="register.php" class="text-right">Sign up</a>
                            </fieldset>
                            <a href="index.php">Home Page</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
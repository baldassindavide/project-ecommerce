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
    <title>Order Details</title>
</head>

<body>
    <div id="login-column" class="col-md-3">
        <h1>Order Details</h1>
        <label for="street" class="form-info">Street:</label>
        <input type="text" name="street" placeholder="Street" class="form-control"><br>
        <label for="town" class="form-info">Town: </label>
        <input type="text" name="town" placeholder="Town" class="form-control"><br>
        <label for="province" class="form-info">Province: </label>
        <input type="text" name="province" placeholder="Province" class="form-control"><br>
        <label for="CAP" class="form-info">Post Code: </label>
        <input type="number" name="CAP" placeholder="Post Code" class="form-control"><br>
        <a href="index.php?order-done" class="btn btn-primary">Order</a>
    </div>

</body>

</html>
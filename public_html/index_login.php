<!doctype html>
<?php
include "login.php"
?>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <title>Log in</title>
        <link rel="stylesheet" href="style_login.css">
    <body>
        <div class="login-box">
            <h1>login</h1>
            <form action="login.php" method="POST">
            <div class="textbox">
                <input type="text" placeholder="Username" name="Username" value="">
            </div>
            <div class="textbox">
                <input type="password" placeholder="Password" name="Password" value="">
            </div>
            <input class="btn" type="submit" name="btnLogin" value="Sign in">        
        </div>
        
    </body>
</html>
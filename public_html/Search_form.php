<?php

session_start();

if(!isset($_SESSION['role']))
{
    header('Location: index_login.php');

}

?>
<!doctype html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        Site Maintenance
    </title>
    <link rel="stylesheet" href="Search_style.css">
</head>

<body>

<div class="welcome-text">
        <h1>
SEARCH <span>FOR...</span></h1>

    </div>
    <ul class="nav-area">
        <li><a href="home.html">Home</a></li>
        <li><a href="sea2.php">Search Instruments</a></li>
        <li><a href="sea3.php">Search All Locations</a></li>
        <li><a href="sea4.php">Search Rent Location</a></li>
    </ul>

</body>
</html>

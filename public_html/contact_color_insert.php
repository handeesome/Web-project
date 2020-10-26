<?php
include 'config.php';

// get the post records
$txtColor = $_POST['txtColor'];

// database insert SQL code
$sql = "INSERT INTO `inst_color` (`color_name`) 
		VALUES ('$txtColor')";

// insert in database 
$rs = mysqli_query($conn, $sql);
if ($done)
{
    header("Location: /success_feedback.html");
    exit;
}

?>



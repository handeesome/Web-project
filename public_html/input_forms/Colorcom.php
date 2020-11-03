<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
include '../config.php';

// get the post records
$txtColor = $_POST['txtColor'];

// database insert SQL code
$sql = "INSERT INTO `inst_color` (`color_id`,`color_name`) VALUES ('0', '$txtColor')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}
?>

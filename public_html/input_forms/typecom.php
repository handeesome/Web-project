<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
include 'config.php';

// get the post records
$txtType = $_POST['txtType'];

// database insert SQL code
$sql = "INSERT INTO `inst_size` (`size_id`,`size_detail`) VALUES ('0', '$txtType')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}
?>
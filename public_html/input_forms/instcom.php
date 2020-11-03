<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
include 'config.php';

// get the post records
$intManID = $_POST['intManID'];
$intColorID = $_POST['intColorID'];
$intYear = $_POST['intYear'];
$txtAV = $_POST['txtAV'];

// database insert SQL code
$sql = "INSERT INTO `inst_instrument` (`inst_no`,`manuf_id`,`color_id`,`year`,`inst_availableFl`) VALUES ('0', '$intManID','$intColorID','$intYear','$txtAV')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}
?>

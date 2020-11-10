<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
include '../config.php';

// get the post records
$intLocZip = $_POST['intLocZip'];
$intInstNo = $_POST['intInstNo'];


// database insert SQL code
$sql = "INSERT INTO `inst_instrument_location` (`location_id`,`location_zip`,`inst_no`) VALUES ('0', '$intLocZip','$intInstNo')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}
?>
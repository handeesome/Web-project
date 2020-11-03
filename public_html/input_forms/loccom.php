<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
$con = mysqli_connect('localhost', 'root', '','team23');

// get the post records
$intLocZip = $_POST['intLocZip'];
$txtLocCity = $_POST['txtLocCity'];
$txtLocAdd = $_POST['txtLocAdd'];
// database insert SQL code
$sql = "INSERT INTO `inst_locations` (`location_id`,`location_zip`,`location_city`,`location_address`) VALUES ('0', '$intLocZip', '$txtLocCity', '$txtLocAdd')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}
?>

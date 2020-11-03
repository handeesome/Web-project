<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
include 'config.php';

// get the post records
$intrentid = $_POST['intrentid'];
$datepaystart = strtotime($_POST["datepaystart"]);
$datepaystart = date('Y-m-d H:i:s', $datepaystart);
$datepayend = strtotime($_POST["datepayend"]);
$datepayend = date('Y-m-d H:i:s', $datepayend);
$intprice = $_POST['intprice'];
$txtSucc = $_POST['txtSucc'];
// database insert SQL code
$sql = "INSERT INTO `inst_payment` (`payment_id`,`rent_id`,`payment_start_time`,`payment_end_time`,`price`,`payment_status`) VALUES ('0', '$intrentid', '$datepaystart', '$datepayend', '$intprice', '$txtSucc')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}
?>
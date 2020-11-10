<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
include '../config.php';

// get the post records
$intrentlocid = $_POST['intrentlocid'];
$daterentstart = strtotime($_POST["daterentstart"]);
$daterentstart = date('Y-m-d H:i:s', $daterentstart);
$daterentend = strtotime($_POST["daterentend"]);
$daterentend = date('Y-m-d H:i:s', $daterentend);
$intinstpick = $_POST['intinstpick'];
$intuserins = $_POST['intuserins'];
$txtstatus = $_POST['txtstatus'];
// database insert SQL code
$sql = "INSERT INTO `inst_rent` (`rent_id`,`rent_location_id`,`rent_from_date`,`rent_to_date`,`rent_inst_no`,`rent_user_id`,`rent_status`) VALUES ('0', '$intrentlocid', '$daterentstart', '$daterentend', '$intinstpick', '$intuserins', '$txtstatus')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}
?>
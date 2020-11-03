<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
include '../config.php';

// get the post records
$txtManBrand = $_POST['txtManBrand'];
$txtManModel = $_POST['txtManModel'];
$intManRate = $_POST['intManRate'];
$intSizeId = $_POST['intSizeId'];
// database insert SQL code
$sql = "INSERT INTO `inst_manuf` (`manuf_id`,`manuf_brand`,`manuf_model`,`manuf_rate`,`size_id`) VALUES ('0', '$txtManBrand', '$txtManModel', '$intManRate', '$intSizeId')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}
?>

<?php
include 'config.php';

// get the post records
$txtLocZip = $_POST['txtLocZip'];
$txtLocCit = $_POST['txtLocCit'];
$txtLocAdd = $_POST['txtLocAdd'];

// database insert SQL code
$sql = "INSERT INTO `inst_locations` (`location_zip`, `location_city`, `location_address`) 
		VALUES ('$txtLocZip', '$txtLocCit', '$txtLocAdd')";

// insert in database 
$rs = mysqli_query($conn, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}else{
    echo "Contact Records Not Inserted";
}

?>



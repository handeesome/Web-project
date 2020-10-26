<?php
include 'config.php'

// get the post records
$txtPickupLocation = $_POST['txtPickupLocation'];
$txtRentDate = $_POST['txtRentDate'];
$txtRentFromDate = $_POST['txtRentFromDate'];
$txtRentToDate = $_POST['txtRentToDate'];
$txtRentStatus = $_POST['txtRentStatus'];

// database insert SQL code
$sql = "INSERT INTO `inst_rent` (`rent_pickup_location`, `rent_date`, `rent_from_date`, `rent_to_date`, `rent_status`) 
		VALUES ('$txtPickupLocation', '$txtRentDate', '$txtRentFromDate', '$txtRentToDate', '$txtRentStatus')";

// insert in database 
$rs = mysqli_query($conn, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}else{
    echo "Contact Records Not Inserted";
}

?>



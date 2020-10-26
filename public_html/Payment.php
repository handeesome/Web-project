<?php
include 'config.php';

// get the post records
$txtPaymentStartTime = $_POST['txtPaymentStartTime'];
$txtPaymentEndTime = $_POST['txtPaymentEndTime'];
$txtPrice = $_POST['txtPrice'];

// database insert SQL code
$sql = "INSERT INTO `inst_payment` (`payment_start_time`, `payment_end_time`, `price`) 
		VALUES ('$txtPaymentStartTime', '$txtPaymentEndTime', '$txtPrice    ')";

// insert in database 
$rs = mysqli_query($conn, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}else{
    echo "Contact Records Not Inserted";
}

?>



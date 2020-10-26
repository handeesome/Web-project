<?php
include 'config.php';

// get the post records
$txtManufBrand = $_POST['txtManufBrand'];
$txtManufModel = $_POST['txtManufModel'];
$txtManufRate = $_POST['txtManufRate'];

// database insert SQL code
$sql = "INSERT INTO `inst_manuf` (`manuf_brand`, `manuf_model`, `manuf_rate`) 
		VALUES ('$txtManufBrand', '$txtManufModel', '$txtManufRate')";

// insert in database 
$rs = mysqli_query($conn, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}else{
	echo "Contact Records Inserted";
}

?>



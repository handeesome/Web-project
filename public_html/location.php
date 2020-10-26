<?php
include 'config.php';

// get the post records
$txtInstrLoc = $_POST['txtInstrLoc'];
$txtInstrType = $_POST['txtInstrType'];

// database insert SQL code
$sql = "INSERT INTO `inst_instument_location` (`location_zip`, `inst_no`) 
		VALUES ('$txtInstrLoc', '$txtInstrType')";

// insert in database 
$rs = mysqli_query($conn, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}else{
	echo "Contact Records Inserted";
}

?>



<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');
include '../config.php';

// get the post records
$txtUsername= $_POST['txtUsername'];
$txtUsrPswd = $_POST['txtUsrPswd'];
$txtUsremail = $_POST['txtUsremail'];
$txtUsrphone = $_POST['txtUsrphone'];
$date_DOB = strtotime($_POST["date_DOB"]);
$date_DOB = date('Y-m-d H:i:s', $date_DOB);
// database insert SQL code
$sql = "INSERT INTO `inst_user` (`user_id`, `user_name`, `user_password`, `user_email`, `user_phone`, `user_DOB`) VALUES ('0', '$txtUsername', '$txtUsrPswd', '$txtUsremail', '$txtUsrphone', '$date_DOB')";

// insert in database 
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Contact Records Inserted";
}else{
	echo "Failed to insert records";
}
?>
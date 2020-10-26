<?php
$conn = mysqli_connect('localhost', 'group23', 'FgwMm3', 'group23');


// get the post records
$txtFirstName = $_POST['txtFirstName'];
$txtLastName = $_POST['txtLastName'];
$txtPassword = $_POST['txtPassword'];
$txtEmail = $_POST['txtEmail'];
$txtPhone = $_POST['txtPhone'];

// database insert SQL code
$sql = "INSERT INTO `inst_user` (`user_firstname`, `user_lastname`, `user_password`, `user_email`, `user_phone`) 
		VALUES ('$txtFirstName', '$txtLastName', '$txtPassword', '$txtEmail', '$txtPhone')";

// insert in database 
$rs = mysqli_query($conn, $sql);
if ($done)
{
    header("Location: /success_feedback.html");
    exit;
}

?>



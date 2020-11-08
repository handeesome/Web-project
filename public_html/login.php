<?php

session_start();
require_once "config.php";

$message= "";
$role = "";
if(isset($_POST["btnLogin"]))
{
    $username = $_POST["Username"];
    $password = $_POST["Password"];

    $query = "SELECT * FROM inst_user WHERE user_name='$username' AND 
    user_password='$password'";
    $result = mysqli_query($conn,$query);

    if(mysqli_num_rows($result)>0)
    {
        while($row = mysqli_fetch_assoc($result))
        {
            if($row["user_role"] == "admin")
            {
                $_SESSION['AdminUser'] = $row["user_name"];
                $_SESSION['role'] = $row["user_role"];
                header('Location: Maintenance.php');
            }
            else
            {
                $_SESSION['User'] = $row["Username"];
                $_SESSION['role'] = $row["Role"];
                header('Location: search_inst.php');
            }
        }

    }
    else{
        header('Location: login.php');
    }

}


?>
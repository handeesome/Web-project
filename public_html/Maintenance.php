<!DOCTYPE html>
<?php

session_start();

if(isset($_SESSION['role']))
{
    if($_SESSION['role'] != 'admin')
    {
        header('Location: UserNoAccess.php');
    }
}
else
{
    header('Location: index_login.php');
}

?>

<html>
<body>

<h1>HTML Links</h1>

<p><a href="input_forms/usercom.html">User Account CReation</a></p>
<p><a href="input_forms/rentcom.html">How long have you rented this instrument and what will the price be for said period</a></p>
<p><a href="input_forms/paycom.html">Pay a Rental Fee!</a></p>
<p><a href="input_forms/instcom.html">Add an instrument into the list</a></p>
<p><a href="input_forms/typecom.html">Insert an instrument type for seleciton in another form</a></p>
<p><a href="input_forms/Manufcom.html">Manufacturer insert of an instrument</a></p>
<p><a href="input_forms/loccom.html">Insert a pickup location for expanding the business</a></p>
<p><a href="input_forms/instloccom.html">Insert a location where an instrument might be found</a></p>
<p><a href="input_forms/Colorcom.html">Insert a color for selection elsewhere</a></p>
</body>
</html>
<html>
<div>
    <label">Show rented items in the selected location:</label>
        <form method="POST">
            <select name="dropdownZip" id="table">
                <?php
                $db = mysqli_connect("10.72.1.14", "group23", "FgwMm3", "group23");
                if ($db->connect_error) {
                    die("FAILED!" . $db->connect_error . "<br>");
                } else {
                    $sql = "SELECT location_city, location_zip FROM inst_locations;";
                    $result = $db->query($sql);
                    while ($row = mysqli_fetch_array($result)) {
                        echo ("<option value='" . $row['location_zip'] . "'> " . $row['location_city'] . "</option>");
                    }
                }
                ?>
            </select>
            <input type='submit' name='button' value='Search'>
        </form>
</div>
<?php

if (isset($_POST['button'])) {
    $zip = $_POST['dropdownZip'];
    $result = mysqli_query($db,"SELECT location_city FROM inst_locations WHERE location_zip = $zip");
    while($row = mysqli_fetch_array($result)){
        $location = $row['location_city'];
       $sql = "SELECT inst_no,color_id,year,manuf_id FROM inst_instrument WHERE inst_no IN(
        SELECT rent_inst_no FROM inst_rent WHERE rent_location_id In (SELECT location_id FROM inst_locations WHERE location_city = '$location'));";
    }
    
    $instno = mysqli_query($db, $sql);
    echo "<form method='POST' action='search_result.php'>";
    echo "Showing Instruments that are rented in : ". $location;
    if (mysqli_num_rows($instno) == 0) {
        echo "<br> No instruments in this location!";
    }
    while ($row = mysqli_fetch_array($instno)) {
        if ($row['color_id'] == 1) {
            $color = "Basswood";
        } elseif ($row['color_id'] == 2) {
            $color = "Cedar";
        } elseif ($row['color_id'] == 3) {
            $color = "Cherry";
        } elseif ($row['color_id'] == 4) {
            $color = "Walnut";
        }

        echo "<p><input type='submit' name='inst' value='" . $row['inst_no'] . "'> Color is:" . $color . " ; Manufacturer ID : " . $row['manuf_id'] . " ; Year: " . $row['year'];
    }
    echo "</form>";
}
?>

</html>
<html>
<?php
$db = mysqli_connect("10.72.1.14", "group23", "FgwMm3", "group23");

$instid = $_POST['inst'];

$sql = "SELECT inst_no,manuf_id,color_id,year FROM inst_instrument WHERE inst_no = '$instid';";
$sql1 = "SELECT location_zip FROM inst_instrument_location WHERE inst_no='$instid';";

$result = mysqli_query($db,$sql);
$result1 = mysqli_query($db,$sql1);
while ($row = mysqli_fetch_array($result1)) {
    $temp = $row['location_zip'];

    $location = mysqli_query($db, "SELECT location_city, location_address FROM inst_locations WHERE location_zip =$temp;");
}
while ($row = mysqli_fetch_array($result)) {
    
    if ($row['color_id'] == 1) {
        $color = "Basswood";
    } elseif ($row['color_id'] == 2) {
        $color = "Cedar";
    } elseif ($row['color_id'] == 3) {
        $color = "Cherry";
    } elseif ($row['color_id'] == 4) {
        $color = "Walnut";
    }
    echo "<p> Instrument ID: " . $row['inst_no'] . "</p>";
    echo "<p> Instrument color : " . $color . "</p>";
    echo "<p> Instrument Year: " . $row['year'] . "</p>";
    echo "<p> Instrument Manufacturer ID: " . $row['manuf_id'] . "</p>";
}
while ($row = mysqli_fetch_array($location)) {
    echo "<p> Location address: " . $row['location_address'] . "</p>";
    echo "<p> Location city: " . $row['location_city'] . "</p>";
}
?>

</html>
<html>
<div>
    <label">Choose a table:</label>
        <form method="POST">
            <select name="dropdownName" id="table">
                <?php
                $db = mysqli_connect("10.72.1.14", "group23", "FgwMm3", "group23");
                if ($db->connect_error) {
                    die("FAILED!" . $db->connect_error . "<br>");
                } else {
                    $sql = "SELECT manuf_id, manuf_brand FROM inst_manuf;";
                    $result = $db->query($sql);
                    while ($row = mysqli_fetch_array($result)) {
                        echo ("<option value='" . $row['manuf_id'] . "'> " . $row['manuf_brand'] . "</option>");
                    }
                }
                ?>
            </select>
            <input type='submit' name='button' value='Search'>
        </form>
</div>
<?php

if (isset($_POST['button'])) {
    $manuf = $_POST['dropdownName'];

    $sql = "SELECT inst_no,color_id,year,manuf_id FROM inst_instrument WHERE manuf_id = $manuf;";
    $instno = mysqli_query($db, $sql);
    echo "<form method='POST' action='search_result.php'>";
    if (mysqli_num_rows($instno) == 0) {
        echo "No results found!";
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
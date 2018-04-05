<?php

$servername = "localhost";
$username = "root";

$conn = mysqli_connect($servername, $username,"","company");

if (!$conn) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}

echo "Success: A proper connection to MySQL was made!";
echo "<br>";
echo "Host information: " . mysqli_get_host_info($conn);
echo "<br><br>";

// mysqli_close($con);
?>
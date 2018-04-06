<?php
function doDB() {
    global $mysqli;
    
    // server credentials
    $servername = "localhost";
    $username = "root";
    $databaseName = "address_db";

	// connect to server 
	$mysqli = mysqli_connect($servername, $username, "", $databaseName);
	

	// connection failed - stop script and alert
	if (mysqli_connect_errno()) {
		printf("Connect failed: %s\n", mysqli_connect_error());
		exit();
	}
}
?>
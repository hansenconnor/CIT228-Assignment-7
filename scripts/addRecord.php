<?php
// edit this to be include l8r
$mysqli = mysqli_connect("localhost", "root", "", "company");

if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
} else {
    $clean_text = mysqli_real_escape_string($mysqli, $_POST['empName']);
    $clean_text = test_input($clean_text);
    $sql = "INSERT INTO employee (firstName) VALUES ('".$clean_text."')";
    $res = mysqli_query($mysqli, $sql);

    if ($res === TRUE) {
        echo "A record has been inserted.";
    } else {
        printf("Could not insert record: %s\n", mysqli_error($mysqli));
    }

mysqli_close($mysqli);
}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>
<br>
<a href="../index.html">Return to Main Menu</a>
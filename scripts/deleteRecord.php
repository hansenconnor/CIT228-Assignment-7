<?php
include '../includes/connect.php';
doDB();

if (!$_POST)  {
	//haven't seen the selection form, so show it
	$display_block = "<h1>Select an Entry</h1>";

	//get parts of records
	$get_list_sql = "SELECT id,
	                 CONCAT_WS(', ', l_name, f_name) AS display_name
	                 FROM master_name ORDER BY l_name, f_name";
	$get_list_res = mysqli_query($mysqli, $get_list_sql) or die(mysqli_error($mysqli));

	if (mysqli_num_rows($get_list_res) < 1) {
		//no records
		$display_block .= "<p><em>Sorry, no records to select!</em></p>";

	} else {
		//has records, so get results and print in a form
		$display_block .= "
		<form method=\"post\" action=\"".$_SERVER['PHP_SELF']."\">
		<p><label for=\"sel_id\">Select a Record:</label><br/>
		<select id=\"sel_id\" name=\"sel_id\" required=\"required\">
		<option value=\"\">-- Select One --</option>";

		while ($recs = mysqli_fetch_array($get_list_res)) {
			$id = $recs['id'];
			$display_name = stripslashes($recs['display_name']);
			$display_block .= "<option value=\"".$id."\">".$display_name."</option>";
		}

		$display_block .= "
		</select></p>
		<button type=\"submit\" name=\"submit\" value=\"del\">Delete Selected Entry</button>
		</form>";
	}
	//free result
	mysqli_free_result($get_list_res);
} else if ($_POST) {
	//check for required fields
	if ($_POST['sel_id'] == "")  {
		header("Location: deleteRecord.php");
		exit;
	}

    //create safe version of ID
    $safe_id = mysqli_real_escape_string($mysqli, $_POST['sel_id']);

	//issue queries
	$del_master_sql = "DELETE FROM master_name WHERE id = '".$safe_id."'";
	$del_master_res = mysqli_query($mysqli, $del_master_sql) or die(mysqli_error($mysqli));

	$del_address_sql = "DELETE FROM address WHERE master_id = '".$safe_id."'";
	$del_address_res = mysqli_query($mysqli, $del_address_sql) or die(mysqli_error($mysqli));

	$del_tel_sql = "DELETE FROM telephone WHERE master_id = '".$safe_id."'";
	$del_tel_res = mysqli_query($mysqli, $del_tel_sql) or die(mysqli_error($mysqli));

	$del_fax_sql = "DELETE FROM fax WHERE master_id = '".$safe_id."'";
	$del_fax_res = mysqli_query($mysqli, $del_fax_sql) or die(mysqli_error($mysqli));

	$del_email_sql = "DELETE FROM email WHERE master_id = '".$safe_id."'";
	$del_email_res = mysqli_query($mysqli, $del_email_sql) or die(mysqli_error($mysqli));

	$del_note_sql = "DELETE FROM personal_notes WHERE master_id = '".$safe_id."'";
	$del_note_res = mysqli_query($mysqli, $del_note_sql) or die(mysqli_error($mysqli));

	mysqli_close($mysqli);

	$display_block = "<h1>Record(s) Deleted</h1><p>Would you like to
	<a href=\"".$_SERVER['PHP_SELF']."\">delete another</a>?...Return to the <a href='../index.html'>main menu</a>?</p>";
}
?>
<!DOCTYPE html>
<html>
<head>
<title>Delete Record</title>
<link href="../css/styles.css" type="text/css" rel="stylesheet" />
<?php include '../includes/externalHead.html'; ?>
</head>
<body>
	<section class="vertical-center">
		<div class="container">
			<div class="row menu-row">
				<div class="col-md-6 offset-md-3">
					<?php echo $display_block; ?>    
				</div>
			</div>
		</div>
	</section>
</body>
</html>

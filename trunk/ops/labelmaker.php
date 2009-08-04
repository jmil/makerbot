<?php
	function open_db()
	{
		$db = new SQLiteDatabase("labels.db");
		$q = $db->query('PRAGMA table_info(product)');
		if ($q->numRows() == 0) {
		   $db->query('create table product(
				   id integer primary key,
				   title varchar(255),
				   subtitle varchar(255),
				   url varchar(255),
				   sku varchar(32))');
		}
		return $db;
	}

	$db = open_db();

	$title = $_POST['title'];
	$subtitle = $_POST['subtitle'];
	$url = $_POST['url'];
	$sku = $_POST['sku'];
	$debug = $_POST['debug'];
	$command ="python labelmaker.py -o - -t ".escapeshellarg($title);
	if ($subtitle) { $command .= " -s ".escapeshellarg($subtitle); } 
	if ($url) { $command .= " -u ".escapeshellarg($url); }
	if ($sku) { $command .= " -c ".escapeshellarg($sku); }
	if ($debug) { $command .= " --debug"; }
	else {
	  // Add row to printed labels db
	  $db->query("insert into product (title, subtitle, url, sku) values ('" . 
	  		     sqlite_escape_string($title) . "', '" . 
			     sqlite_escape_string($subtitle) . "', '" . 
			     sqlite_escape_string($url) . "', '" . 
			     sqlite_escape_string($sku) . "')");
	}	   

	$filename = str_replace(" ", "-", $title);
	$filename = preg_replace("/[^-a-zA-Z0-9]/", "", $filename);
	$filename = strtolower($filename) . ".pdf";
	
	header("Content-Type: application/pdf");
	header("Content-disposition: attachment; filename=$filename");
	passthru($command);
?>

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

	function store_in_db($db,$title,$subtitle,$url,$sku)
	{
	  $db->query("insert into product (title, subtitle, url, sku) values ('" . 
	  		     sqlite_escape_string($title) . "', '" . 
			     sqlite_escape_string($subtitle) . "', '" . 
			     sqlite_escape_string($url) . "', '" . 
			     sqlite_escape_string($sku) . "')");
	}

	function update_in_db($db,$id,$title,$subtitle,$url,$sku)
	{
	  $db->query("update product set ".
	  		     "title='".sqlite_escape_string($title) . "', " . 
			     "subtitle='".sqlite_escape_string($subtitle) . "', " . 
			     "url='".sqlite_escape_string($url) . "', " . 
			     "sku='".sqlite_escape_string($sku) . "' " .
			     "where id=".$id);
	}

	function delete_from_db($db,$id)
	{
	  $db->query("delete from product where id=".$id);
	}

	function show_id($id)
	{
		$host=$_SERVER['HTTP_HOST'];
		$uri=rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
		$redir = "Location: http://$host$uri/labels.php";
		if ($id != -1) {
		   $redir = $redir . "?id=".$id;
		}
		header($redir);
	}

	$db = open_db();

	$id = $_POST['id'];
	$title = $_POST['title'];
	$subtitle = $_POST['subtitle'];
	$url = $_POST['url'];
	$sku = $_POST['sku'];
	$debug = $_POST['debug'];

	if ($_POST['generate']) {
		$command ="python labelmaker.py -o - -t ".escapeshellarg($title);
		if ($subtitle) { $command .= " -s ".escapeshellarg($subtitle); } 
		if ($url) { $command .= " -u ".escapeshellarg($url); }
		if ($sku) { $command .= " -c ".escapeshellarg($sku); }
		if ($debug) { $command .= " --debug"; }
		$filename = str_replace(" ", "-", $title);
		$filename = preg_replace("/[^-a-zA-Z0-9]/", "", $filename);
		$filename = strtolower($filename) . ".pdf";
		header("Content-Type: application/pdf");
		header("Content-disposition: attachment; filename=$filename");
		passthru($command);
	} else if ($_POST['store']) {
	       store_in_db($db,$title,$subtitle,$url,$sku);
	       $rowid = $db->lastInsertRowid();
	       show_id($rowid);
	} else if ($_POST['update']) {
	       update_in_db($db,$id,$title,$subtitle,$url,$sku);
	       show_id($id);
	} else if ($_POST['delete']) {
	       delete_from_db($db,$id);
	       show_id(-1);
	} else {
	       show_id(-1);
	}
?>

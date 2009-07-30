<?php
	$title = escapeshellarg($_POST['title']);
	$subtitle = escapeshellarg($_POST['subtitle']);
	$url = escapeshellarg($_POST['url']);
	$sku = escapeshellarg($_POST['sku']);
	$command ="python labelmaker.py -o - -t ".$title;
	if ($subtitle) { $command .= " -s ".$subtitle; } 
	if ($url) { $command .= " -u ".$url; }
	if ($sku) { $command .= " -c ".$sku; }
	
	$filename = str_replace(" ", "-", $title);
	$filename = preg_replace("/[^-a-zA-Z0-9]/", "", $filename);
	$filename = strtolower($filename) . ".pdf";
	
	header("Content-Type: application/pdf");
	header("Content-disposition: attachment; filename=$filename");
	passthru($command);
?>

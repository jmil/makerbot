<?php
	$title = escapeshellarg($_POST['title']);
	$subtitle = escapeshellarg($_POST['subtitle']);
	$url = escapeshellarg($_POST['url']);
	$sku = escapeshellarg($_POST['sku']);
	$command ="python labelmaker.py -o - -t ".$title;
	if ($subtitle) { $command .= " -s ".$subtitle; } 
	if ($url) { $command .= " -u ".$url; }
	if ($sku) { $command .= " -c ".$sku; }
	header("Content-Type: application/pdf");
	passthru($command);
?>

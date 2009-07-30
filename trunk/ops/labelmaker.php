<?php
	$filename = tempnam("/tmp","Label_").".pdf";
	$title = escapeshellarg($_POST['title']);
	$subtitle = escapeshellarg($_POST['subtitle']);
	$url = escapeshellarg($_POST['url']);
	$sku = escapeshellarg($_POST['sku']);
	$command ="python labelmaker.py -o ".getcwd().$filename." -t ".$title;
	if ($subtitle) { $command .= " -s ".$subtitle; } 
	if ($url) { $command .= " -u ".$url; }
	if ($sku) { $command .= " -c ".$sku; }
	exec($command);
	header("Location: " . $filename);
?>

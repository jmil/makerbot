<?
	$printLength = 7; //in days
	$operations = 1000000; //number of moves
	$feedrate = 5000; // in mm/minute
	
	//calculate some variables.
	$minutes = $printLength * 60 * 24;
	$totalLength = $minutes * $feedrate;
	$moveLength = $totalLength / $operations;
	
	//output a bit of info.
	echo "(Axis Tester Script)\n";
	echo "(Runtime: {$printLength} days)\n";
	echo "(Operations: {$operations})\n";
	echo "(Move length: {$moveLength})\n";
	echo "\n";
	echo "G92 X0 Y0 Z0 (set to home)\n";
	echo "G90 (absolute positioning)\n";
	
	//actually output the moves.
	$target = $moveLength/2;
	for ($i=0; $i<$operations; $i++)
	{
		echo "G1 X{$target} F{$feedrate} ({$i})\n";
		$target = -$target;
	}
	
	echo "G1 X0 F{$feedrate} (end)\n";
?>

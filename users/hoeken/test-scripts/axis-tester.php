<?
	$printLength = 1; //in hours 
	$distance = 80; //in mm
	$feedrate = 3000; // in mm/minute

	$total_seconds = $printLength * 60 * 60;

	$target = $distance/2;
	$movetime = $distance / ($feedrate / 60);
	
	echo "G90\n";
	
	while ($total_seconds > 0)
	{
		$total_seconds -= $movetime;
		$target = -$target;
		
		echo "G1 X{$target} F{$feedrate} ({$total_seconds})\n";
	}
	
	echo "G1 X0 F{$feedrate} (end)\n";
?>

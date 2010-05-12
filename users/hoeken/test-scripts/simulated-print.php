<?
	$printLength = 8; //in hours 

	warmup();
	print_cycle($printLength);
	cooldown();

	function warmup()
	{
		echo "M104 S225 (Temp to 220)\n";
		echo "M108 S255 (speed 255)\n";
 		echo "G4 P600000 (wait 10 mins to heat up)\n";
	}

	function print_cycle($hours)
	{
		$millis = $hours * 60 * 60 * 1000;
		
		while ($millis >= 0)
		{
			//turn it on for anywhere between 0.5 seconds and 5 minutes
			//turn it off for anywere between 0.1 seconds and 10 seconds
			$on_millis = rand(500, 300000);
			$off_millis = rand(100, 10000);

			echo "M101 (extruder on, forward)\n";
			echo "G4 P{$on_millis}\n";
			echo "M103 (stop extruding)\n";
			echo "G4 P{$off_millis}\n";
			
			$millis -= $on_millis;
			$millis -= $off_millis;
	 	}
	}

	function cooldown()
	{
		echo "M104 S0 (turn heater off)\n";
		echo "M103 (extruder off)\n";
	}
?>

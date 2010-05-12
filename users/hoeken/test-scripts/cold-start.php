<?
	warmup();
	for ($i=0; $i<24; $i++)
	{
		hour_cycle();
	}
	cooldown();

	function warmup()
	{
		echo "M104 S225 (Temp to 220)\n";
		echo "M108 S255 (speed 255)\n";
 		echo "G4 P600000 (wait 10 mins to heat up)\n";
	}

	function hour_cycle()
	{
		for ($i=0; $i<40; $i++)
		{
			echo "M101 (extruder on, forward)\n";
			echo "G4 P27000 (extrude almost 1 minute)\n";
			echo "M103 (stop extruding)\n";
			echo "G4 P3000 (wait 3 seconds)\n";
		}

		echo "M104 S0 (Temp to 0)\n";
		echo "G4 P1800000 (wait 30 minutes)\n";
		echo "M104 S225 (Temp to 220)\n";
 		echo "G4 P600000 (wait 10 mins to heat up)\n";
	}

	function cooldown()
	{
		echo "M104 S0 (turn heater off)\n";
	}
?>

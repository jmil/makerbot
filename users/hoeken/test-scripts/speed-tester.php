<?
	$axis = "Z";

	$startRate = 100; //starting feedrate in mm/min
	$endRate = 2000; //ending feedrate in mm/min
	$speedIncrement = 100; //increment to increase speed, in mm/min
	
	$maxTravel = 80; //max travel in mm
	$delay = 1;  //how long to delay between speeds in milliseconds

	$operations = round(($endRate-$startRate)/$speedIncrement);

	//output a bit of info.
	echo "(Speed Tester Script)\n";
	echo "(Starting Feedrate: {$startRate})\n";
	echo "(Ending Feedrate: {$endRate})\n";
	echo "(Speed Increment: {$speedIncrement})\n";
	echo "(Max Travel: {$maxTravel})\n";
	echo "\n";
	echo "G92 X0 Y0 Z0 (set to home)\n";
	echo "G90 (absolute positioning)\n";
	
	//actually output the moves.
	for ($i=0; $i<=$operations; $i++)
	{
		//how fast are we going this round?
		$feedrate = $startRate + $speedIncrement*$i;
		
		//where are we going?
		$target = ($maxTravel * $feedrate/$endRate)/2;
		
		echo "G1 {$axis}{$target} F{$feedrate} ({$i})\n";
		echo "G1 {$axis}-{$target} F{$feedrate} ({$i})\n";
		echo "G4 P{$delay}\n";
	}
	
	echo "G1 {$axis}0 F{$feedrate} (end)\n";
	echo "G18 (disable drives)\n";
?>

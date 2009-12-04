woodThickness = 5.0;

translate([-450/2, -150, -150)
MakerWave();

module MakerWave()
{
	frontPlate();
	backPlate();
	leftPlate();
	rightPlate();
	topPlate();
	bottomPlate();
	middlePlate();
	ZStageTopPlate();
}

module frontPlate()
{
	translate([0,685,285])
		rotate([0,0,0])
			woodenPlate("Front");
}

module backPlate()
{
	translate([0,0,0])
		rotate([0,0,0])
			woodenPlate("Back");
}

module leftPlate()
{
	translate([0,0,342.5])
		rotate([0,-90,0])
			woodenPlate("Left");
}

module rightPlate()
{
	translate([455,0,-857.5])
		rotate([0,-90,0])
			woodenPlate("Right");
}

module topPlate()
{
	translate([0,292.5,635])
		rotate([-90,0,0])
			woodenPlate("Top");
}

module bottomPlate()
{
	translate([0,12.5,-50])
		rotate([-90,0,0])
			woodenPlate("Bottom");
}

module middlePlate()
{
	translate([355,0,797.5])
		rotate([0,90,0])
			woodenPlate("Middle");
}

module ZStageTopPlate()
{
	translate([0,184.725,800])
		rotate([-90,0,0])
			woodenPlate("Z Stage Top");
}

module woodenPlate(layer, thickness=woodThickness)
{
	dxf_linear_extrude(
		file = "body.dxf",
		layer = layer,
		height = thickness,
		convexity = 10
	);
}

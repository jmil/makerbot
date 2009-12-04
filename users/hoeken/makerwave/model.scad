woodThickness = 5.0;

MakerWave();

module MakerWave()
{
	rotate([90, 0, 0])
	{
		motorPlate();
		spacerPlate();
		filamentGuide();
		retainerPlate();

		leftDino();
		rightDino();

		heaterAssembly();
	}
	translate([-19.95, 0, 0])
		gearMotor();
	translate([19.95, 0, 0])
		gearMotor();
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

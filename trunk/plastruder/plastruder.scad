module motor_plate()
{
	dxf_linear_extrude(
			file = "main-assembly.dxf",
			layer = "Motor Plate",
			height = 4.5,
			center=true,
			convexity = 2);
}

motor_plate();
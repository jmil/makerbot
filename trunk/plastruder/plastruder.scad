acrylicThickness = 5.6;
	dxf_linear_extrude(
		file = "main-assembly.dxf",
		layer = "Motor Plate",
		height = acrylicThickness
	);

/*

module plastruderMK5()
{
	motorPlate();
}

module motorPlate()
{
	acrylicPlate("Motor Plate");
}

module acrylicPlate(layer)
{
}
*/
acrylicThickness = 5.5;
dinoX = 44.125;

plastruderMK5();

module plastruderMK5()
{
	rotate([90, 0, 0])
	{
		motorPlate();
		spacerPlate();
		filamentGuide();
		retainerPlate();

		leftDino();
		rightDino();
	}
}

module motorPlate()
{
	acrylicPlate("Motor Plate");
}

module spacerPlate()
{
	translate([0,0,acrylicThickness*1])
	{
		acrylicPlate("Spacer Plate");
	}
}

module filamentGuide()
{
	translate([0,0,acrylicThickness*2])
	{
		acrylicPlate("Filament Guide");
	}
}

module retainerPlate()
{
	translate([0,0,acrylicThickness*3])
	{
		acrylicPlate("Retainer Plate");
	}
}

module leftDino()
{
	leftDinoFront();
	leftDinoBack();

	translate([-dinoX, 0, 0])
	{
		dinoSupport();
	}
}

module leftDinoFront()
{
	translate([0,0,acrylicThickness*4])
	{
		acrylicPlate("Dino Left Front");
	}
}

module leftDinoBack()
{
	translate([0, 0, -acrylicThickness])
	{
		acrylicPlate("Dino Left Back");
	}
}

module rightDino()
{
	rightDinoFront();
	rightDinoBack();
}

module rightDinoFront()
{
	translate([0,0,acrylicThickness*4])
	{
		acrylicPlate("Dino Right Front");
	}
}

module rightDinoBack()
{
	translate([0, 0, -acrylicThickness])
	{
		acrylicPlate("Dino Right Back");
	}
}

module dinoSupport()
{
	translate([-acrylicThickness/2, 0, acrylicThickness*2])
	{
		rotate([0, 90, 0])
		{
			acrylicPlate("Dino Support");
		}
	}
}

module acrylicPlate(layer)
{
	dxf_linear_extrude(
		file = "main-assembly.dxf",
		layer = layer,
		height = acrylicThickness,
		convexity = 10
	);
}
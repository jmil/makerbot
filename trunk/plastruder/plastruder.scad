acrylicThickness = 5.5;

dinoX = 44.125;
dinoY = 79;
dinoZ = 139;

heaterZ = 70.5;
heaterY = 33;

/*
rotate([90, 0, 0])
{
	plastruderMK5();
}
*/

plastruderMK5();

module plastruderMK5()
{
		motorPlate();
		spacerPlate();
		filamentGuide();
		retainerPlate();

		leftDino();
		rightDino();

		heaterAssembly();
}

module heaterAssembly()
{
	heaterMount();
}

module heaterMount()
{
	translate([0,-heaterY,heaterZ+acrylicThickness*2.5])
	{
		rotate([-90, 0, 0])
		{
			translate([0,0,-acrylicThickness])
			{
				acrylicPlate("Heater Mount");
			}
			translate([0,0,-acrylicThickness*2])
			{
				acrylicPlate("Insulator Top");
			}
			translate([0,0,-acrylicThickness*3])
			{
				acrylicPlate("Insulator Retainer");
			}
		}
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

	leftDinoTop();
	leftDinoBottom();
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

module leftDinoTop()
{
	translate([0,-dinoY, dinoZ-acrylicThickness*1.5])
	{
		rotate([90, 0, 0])
		{
			acrylicPlate("Dino Left Top Mount");
		}
	}
}

module leftDinoBottom()
{
	translate([0,-(dinoY+acrylicThickness), dinoZ+50-acrylicThickness*1.5])
	{
		rotate([90,0,0])
		{
			acrylicPlate("Dino Left Bottom Mount");
		}
	}
}

module rightDino()
{
	rightDinoFront();
	rightDinoBack();

	translate([dinoX, 0, 0])
	{
		dinoSupport();
	}

	rightDinoTop();
	rightDinoBottom();
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


module rightDinoTop()
{
	translate([0,-dinoY, dinoZ-acrylicThickness*1.5])
	{
		rotate([90, 0, 0])
		{
			acrylicPlate("Dino Right Top Mount");
		}
	}
}

module rightDinoBottom()
{
	translate([0,-(dinoY+acrylicThickness), dinoZ+50-acrylicThickness*1.5])
	{
		rotate([90,0,0])
		{
			acrylicPlate("Dino Right Bottom Mount");
		}
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
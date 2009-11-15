acrylicThickness = 5.5;
filamentGuideThickness = 3.125;
steelThickness = 1.0;


dinoX = 44.125;
dinoY = 79;
dinoZ = 169;

heaterZ = 70.5;
heaterY = 33;

filamentWidth = 3.125;

heaterBarrelLength = 50;
heaterBarrelOD = 6;
heaterBarrelID = 3.125;

insulatorLength = 35;
insulatorOD = 16;
insulatorOverlap = 15;
insulatorID = 3.125;

nozzleOD = 8;
nozzleHeight = 10;
nozzleConeHeight1 = 1.80;
nozzleConeHeight2 = 2.80;
nozzleTipWidth = 2;
nozzleOverlap = 9.3;
nozzleDiameter = 0.5;

motorDiameter = 37;
motorLength = 58.5;
motorStubDiameter = 12;
motorStubLength = 5;
motorShaftDiameter = 6;
motorShaftLength = 15;


plastruderMK5();
//leftDino();

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

		heaterAssembly();
	}
	translate([-19.95, 0, 0])
		gearMotor();
	translate([19.95, 0, 0])
		gearMotor();
}

module gearMotor()
{
	rotate([-90, 2, 0])
	{
		union()
		{
			cylinder(h=motorLength, r=motorDiameter/2);
			translate([0,0,-motorStubLength])
			{
				cylinder(h=motorStubLength, r=motorStubDiameter/2);
				translate([0,0,-motorShaftLength])
					cylinder(h=motorShaftLength, r=motorShaftDiameter/2);
			}
		}
	}
}

module heaterBarrelAssembly()
{
	translate([0,0,-(heaterBarrelLength-insulatorOverlap+insulatorLength)])
	//translate([0,0,0)])
	{
		translate([0,0,heaterBarrelLength-insulatorOverlap])
		{
			thermalBarrier();
			translate([0,0,-5]) retainingWasher();
		}
		heaterBarrel();
		translate([0,0,-(nozzleHeight-nozzleOverlap)])
			nozzle();
	}
}

module heaterBarrel()
{
	difference()
	{
		cylinder(h=heaterBarrelLength, r=heaterBarrelOD/2);
		cylinder(h=heaterBarrelLength, r=heaterBarrelID/2);
	}
}

module thermalBarrier()
{
	difference()
	{
		cylinder(h=insulatorLength, r=insulatorOD/2);
		cylinder(h=insulatorLength, r=filamentWidth/2);
		cylinder(h=insulatorOverlap, r=heaterBarrelOD/2);
	}
}

module retainingWasher()
{
	translate([13.76, -70.50, -steelThickness])
	{
		dxf_linear_extrude(
			file = "main-assembly.dxf",
			layer = "Steel Washer",
			height = steelThickness,
			convexity = 10
		);
	}
}

module nozzle()
{
	difference()
	{
		union()
		{
			cylinder(h=nozzleHeight, r=nozzleOD/2);
	
			translate([0,0,-nozzleConeHeight1])
				cylinder(h=nozzleConeHeight1, r1=0, r2=nozzleOD/2);
			translate([0,0,-nozzleConeHeight2])
				cylinder(h=nozzleConeHeight2, r=nozzleTipWidth/2);
		}
		translate([0,0,nozzleHeight-nozzleOverlap])
		{
			cylinder(h=nozzleOverlap, r=heaterBarrelOD/2);
		}
		translate([0,0,-nozzleConeHeight2])
		{
			cylinder(h=nozzleConeHeight2+nozzleHeight, r=nozzleDiameter/2);
		}
	}
}

module heaterAssembly()
{
	heaterMount();
	rotate([-90, 0, 0])
	{
		translate([13.8,-(acrylicThickness*2.5),-(33+acrylicThickness*2)])
			rotate([0,0,180]) heaterBarrelAssembly();
		translate([-13.8,-(acrylicThickness*2.5),-(33+acrylicThickness*2)])
			heaterBarrelAssembly();
	}
}

module heaterMount()
{
	translate([0,-heaterY,heaterZ+acrylicThickness*2.5])
	{
		rotate([-90, 0, 0])
		{
			translate([0,0,-acrylicThickness])
				acrylicPlate("Heater Mount");
			translate([0,0,-acrylicThickness*2])
				acrylicPlate("Insulator Top");
			translate([0,0,-acrylicThickness*3])
				acrylicPlate("Insulator Retainer");
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
		acrylicPlate("Spacer Plate");
}

module filamentGuide()
{
	translate([0,0,acrylicThickness*2])
		acrylicPlate("Filament Guide", filamentGuideThickness);
}

module retainerPlate()
{
	translate([0,0,acrylicThickness*2+filamentGuideThickness])
		acrylicPlate("Retainer Plate");
}

module leftDino()
{
	leftDinoFront();
	leftDinoBack();

	translate([-dinoX, 0, -1])
		dinoSupport();

	leftDinoTop();
	leftDinoBottom();
}

module leftDinoFront()
{
	translate([0,0,20])
		acrylicPlate("Dino Left Front");
}

module leftDinoBack()
{
	translate([0, 0, -acrylicThickness])
		acrylicPlate("Dino Left Back");
}

module leftDinoTop()
{
	translate([0,-dinoY, dinoZ-acrylicThickness*1.5])
	{
		rotate([90, 0, 0])
			acrylicPlate("Dino Left Top Mount");
	}
}

module leftDinoBottom()
{
	translate([0,-(dinoY+acrylicThickness), dinoZ+80-acrylicThickness*1.5])
	{
		rotate([90,0,0])
			acrylicPlate("Dino Left Bottom Mount");
	}
}

module rightDino()
{
	rightDinoFront();
	rightDinoBack();

	translate([dinoX, 0, 0])
		dinoSupport();

	rightDinoTop();
	rightDinoBottom();
}

module rightDinoFront()
{
	translate([0,0,20])
		acrylicPlate("Dino Right Front");
}

module rightDinoBack()
{
	translate([0, 0, -acrylicThickness])
		acrylicPlate("Dino Right Back");
}


module rightDinoTop()
{
	translate([0,-dinoY, dinoZ-acrylicThickness*1.5])
	{
		rotate([90, 0, 0])
			acrylicPlate("Dino Right Top Mount");
	}
}

module rightDinoBottom()
{
	translate([0,-(dinoY+acrylicThickness), dinoZ+80-acrylicThickness*1.5])
	{
		rotate([90,0,0])
			acrylicPlate("Dino Right Bottom Mount");
	}
}

module dinoSupport()
{
	translate([-acrylicThickness/2, 0, acrylicThickness*2])
	{
		rotate([0, 90, 0])
			acrylicPlate("Dino Support");
	}
}

module acrylicPlate(layer, thickness=acrylicThickness)
{
	dxf_linear_extrude(
		file = "main-assembly.dxf",
		layer = layer,
		height = thickness,
		convexity = 10
	);
}

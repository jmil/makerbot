woodThickness = 4.5;

sideDistanceX = 42.93;
sideDistanceZ = 69.93;

//frostruder();
syringe();
//plunger();

module syringe()
{
	difference()
	{
		union()
		{
			cylinder(h=113.3, r=15.75, convexity=10);
			dxf_linear_extrude(
				file = "clamp.dxf",
				layer = "Syringe Flange",
				height = 2.3,
				convexity = 10
			);
			translate([0,0,113.2]) cylinder(h=7.9, r=9.5/2);
			translate([0,0,113.2+7.8]) cylinder(h=2.5, r=2);
		}
		cylinder(h=112, r=14, convexity=10);
		translate([0,0,112]) cylinder(h=20, r=1);
	}
}

module plunger()
{
	union()
	{
		cylinder(h=2.5, r=33.88/2);
		translate([-1,-27.5/2, 0]) cube([2,27.5,124.5]);
		translate([-27.5/2, -1, 0]) cube([27.5,2,124.5]);
		translate([0,0,124.5])
		{
			cylinder(h=1.6, r=27.5/2);
			translate([0,0,1.6])
			{
				translate([-16.8/2, -1, 0]) cube([16.8, 2, 4.9]);
				translate([-1,-16.8/2, 0]) cube([2, 16.8, 4.9]);
				translate([0,0,4.9])
				{
					cylinder(h=2, r=22.8/2);
					translate([0,0,2]) intersection()
					{
						cylinder(h=4.5, r1=22.8/2, r2=1);
						union()
						{
							translate([-22.8/2, -1, 0])cube([22.8, 2, 4.5]);
							translate([-1,-22.8/2, 0]) cube([2, 22.8, 4.5]);
						}
					}
				}
			}
		}
	}
}

module frostruder()
{
	rotate([90, 0, 0])
	{
		backPanel();
		leftPanel();
		rightPanel();
	
		syringeTop();
		syringeBottom();
	
		topMount();
		bottomMount();
	}

	render()
	{
		translate([0,30,50]) rotate([180, 0, 0]) syringe();
	}
}

module backPanel()
{
	woodPanel("Back Panel");
}

module leftPanel()
{
	translate([sideDistanceX, 0, sideDistanceZ]) rotate([0, 90,0]) woodPanel("Left Panel");
}

module rightPanel()
{
	translate([-sideDistanceX, 0, sideDistanceZ]) rotate([0, -90,0]) woodPanel("Right Panel");
}

module syringeTop()
{
	translate([0,41,170]) rotate([-90,0,0]) woodPanel("Syringe Top");
}

module syringeBottom()
{
	translate([0,-59,80]) rotate([-90,0,0]) woodPanel("Syringe Bottom");
}

module bottomMount()
{
	translate([0,-(75+woodThickness*2),-155]) rotate([-90,0,0]) woodPanel("Bottom Mount");
}

module topMount()
{
	translate([0,-(75+woodThickness),-245]) rotate([-90,0,0]) woodPanel("Top Mount");
}

module woodPanel(layer, thickness=woodThickness)
{
	dxf_linear_extrude(
		file = "frostruder.dxf",
		layer = layer,
		height = thickness,
		convexity = 10
	);
}

lathe_tool();

module lathe_tool()
{
	length = 60;
	width = 15;
	height = 15;
	hole = 4;
	diameter = 18;
	gearWidth = 12;

	cubeLength = diameter;

	difference()
	{
		union()
		{
			cube(size=[length, width, height], center = true);
			translate([length/2-cubeLength/2, 0, 0])
				cube(size=[cubeLength, width*2, height], center=true);
		}

		translate([length/2-hole, 0, 0])
			rotate([90, 0, 0])
				cylinder(r=diameter/2, h=gearWidth, center=true);

		translate([length/2-hole, 0, 0])
			rotate([90, 0, 0])
				cylinder(r=hole/2, h=width*2, center=true);
	}
}
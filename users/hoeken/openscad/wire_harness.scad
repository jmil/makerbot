wire_harness(10, 3, 10);

module wire_harness(dia, thickness, height)
{
	difference()
	{
		union()
		{
			cylinder(r=dia/2+thickness, h=height, center = true);
			
			translate([dia/2+thickness+height/2-1.1,0,0])
				cube(size=[height+1, thickness, height], center=true);
		}

		cylinder(r=dia/2, h=height, center = true);
		translate([0, dia/2+ thickness*1.5, 0])
			cube(size=[dia+thickness*2, dia+thickness*2, height], center=true);

		translate([(dia+thickness), 0, 0])
			rotate([90, 0, 0])
				cylinder(r=2, h=thickness+1, center=true);
	}
}
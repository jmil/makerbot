botcube();

module botcube()
{
	difference()
	{
		union()
		{
			cube(size=[20, 20, 20], center=true);
	
			for (i=[0:3])
				rotate([0,0,90*i])
					translate([0,-10, 0])
						rotate([90,0,0])
							linear_extrude(file="m.dxf", height=1.5);
		}

		translate([0,0,20/3])
			sphere(r=20/2-2);
	}
}
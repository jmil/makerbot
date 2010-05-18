//nema17();
//motor_coupling();
//assembly();

//bearing625();

//	$fa = 0.1;
//	$fs = 0.1;


filamentDriveHousing();

module assembly()
{
	nema17();
	translate([0,0,2])
		motor_coupling();
}

module nema17()
{
	$fa = 0.1;
	$fs = 0.1;

	shaftLength = 10;

	color([0.75, 0.75, 0.75])
	{
		translate([0,0,-34/2])
		{
			difference()
			{
				union()
				{
					cube(size = [42.3, 42.3, 34], center = true);
					translate([0,0,34/2])
						cylinder(r=11, h=2);
					translate([0,0,34/2+2])
						cylinder(r=2.5, h=shaftLength);
				}
		
				difference()
				{
					cylinder(r=30, h=40, center=true);
					cylinder(r=52.7/2, h=40, center=true);
				}
		
				for (i=[0:3])
				{
					rotate([0, 0, 90*i])
						translate([31/2, 31/2, 34/2-4.4])
							cylinder(r=1.5, h=4.5);
				}
			}
		}
	}
}

module filamentDriveHousing()
{
	height = 45;
	width = 42.3;
	angle = 12.5;
	cutoutSize = 7;

	color([0.75, 0.25, 0.25])
	{
		translate([0,0,0])
		{
			difference()
			{
				union()
				{
					cube(size = [width, width, height], center = true);
				}

				cylinder(r=5/2, h=height+1, center = true);
				
				translate([0,0,-(height/2+0.1)])
					cylinder(r=13/2, h=5);

				translate([0,0,height/2-21])
					cylinder(r=11/2, h=21);

				translate([0,7, -8])
				{
					rotate([0, 90, 0])
					{
						cylinder(r=7.5, h=6, center=true);
						cylinder(r=2, h=width+1, center=true);
					}
				}

				translate([0, 13.5, -height/2])
					cylinder(r=1.5, h=14);

				translate([0,34.5+13.5, -8.5])
				{
					intersection()
					{
						rotate([0, 90, 0])
							rotate_extrude()
								translate([34.5, 0, 0])
									circle(r=1.5);
						translate([0,0,50])
							cube(size = [100, 100, 100], center=true);
					}
				}

/*
				for(i=[0:3])
				{
					rotate([0,0,i*90])
					{
						translate([31/2, 31/2, height/2-5])
						{
							difference()
							{
								rotate([angle, -angle, 0])
								{
									union()
									{
										cylinder(r=3, h=100, center=true);
										translate([3, 0, 0])
											cube(size=[6,6,100], center=true);	
										translate([0, 3, 0])
											cube(size=[6,6,100], center=true);
									}
								}
							
								translate([0,0,50])
									cube(size=[100, 100, 100], center=true);
							}
						}
					}
				}
				
				for(i=[0:3])
				{
					rotate([0,0,i*90])
					{
						translate([31/2, 31/2, -(height/2-5)])
						{
							difference()
							{
								rotate([-angle, angle, 0])
								{
									union()
									{
										cylinder(r=3, h=100, center=true);
										translate([3, 0, 0])
											cube(size=[6,6,100], center=true);	
										translate([0, 3, 0])
											cube(size=[6,6,100], center=true);
									}
								}
							
								translate([0,0,-50])
									cube(size=[100, 100, 100], center=true);
							}
						}
					}
				}
*/


				for(i=[0:3])
				{
					rotate([0,0,i*90])
					{
						translate([31/2, 31/2, 0])
						{
							union()
							{
								cylinder(r=cutoutSize/2, h=height-10, center=true);
								translate([cutoutSize/2, 0, 0])
									cube(size=[cutoutSize, cutoutSize, height-10], center=true);	
								translate([0, cutoutSize/2, 0])
									cube(size=[cutoutSize, cutoutSize, height-10], center=true);
							}
						}
					}
				}

				for (i=[0:3])
				{
					rotate([0, 0, 90*i])
						translate([31/2, 31/2, height/2-5])
							cylinder(r=1.5, h=5);
				}


				for (i=[0:3])
				{
					rotate([0, 0, 90*i])
						translate([31/2, 31/2, -height/2])
							cylinder(r=1.5, h=5);
				}

				difference()
				{
					cylinder(r=35, h=height+1, center=true);
					cylinder(r=52.7/2, h=height+1, center=true);
				}
			}
		}
	}
}

module motor_coupling()
{
	$fa = 0.1;
	$fs = 0.1;

	length = 20;
	diameter = 11;
	bore1 = 4;
	bore2 = 5;
	setScrew = 3;
	setScrewOffset = 5;

	difference()
	{
		cylinder(r=diameter/2, h=length);
		cylinder(r=bore1/2, h=length);
		translate([0,0,length/2])
			cylinder(r=bore2/2, h=length/2);

		translate([0,0,setScrewOffset])
			rotate([90, 0, 0])
				cylinder(r=setScrew/2, h=diameter/2);

		translate([0,0,length-setScrewOffset])
			rotate([90, 0, 0])
				cylinder(r=setScrew/2, h=diameter/2);
	}
}

module drive_rod()
{
	dia = 4;
	length = 40;

	cylinder(r=dia/2, h=length);
}

module bearing625()
{
	od = 13;
	id = 4;
	height = 5;

	difference()
	{
		cylinder(r=od/2, h=height);
		cylinder(r=id/2, h=height);
	}
}

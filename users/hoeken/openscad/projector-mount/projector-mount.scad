projector_mount();

module projector_mount()
{

	$fs = 0.35;

	mount_height = 60;

	difference()
	{
		linear_extrude(file="projector-mount.dxf", height=mount_height);
		
		for (i=[1:3])
		{
			translate([0, 26, mount_height/4*i])
			{
				rotate([0,90, 0])
				{
					union()
					{
						translate([0, 0, 6.1])
							cylinder(r1=1.5, r2=3, h=3);
						translate([0, 0, -1])
							cylinder(r=1.5, h=10);
					}
				}
			}
		}
	}
}
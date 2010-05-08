tp_assembly();

module tp_assembly()
{
	thickness = 10;
	base_diameter = 61;
	hub_diameter = 25;
	cylinder_wall = 2;
	clearance = 1;

	tp_od = 120;
	tp_id = 42;
	tp_length = 110;

	translate([tp_length/2+10, 0, 0])
		tp_arm(thickness, base_diameter, hub_diameter);
	
	translate([-tp_length/2-10, 0, 0])
		rotate([0, 0, 180])
		tp_arm(thickness, base_diameter, hub_diameter);

	translate([0, 0, 80])
		tp_roll(tp_od, tp_id, tp_length);

	translate([-tp_length*0.25+(thickness/2-clearance), 0, 80])
		rotate([0, 90, 0])
			tp_outer(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness); 

	translate([tp_length*0.25-(thickness/2-clearance), 0, 80])
		rotate([0, -90, 0])
			tp_inner(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness); 

	//tp_arm(thickness, base_diameter, hub_diameter);
	//tp_inner(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness); 
	//tp_outer(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness); 
	//tp_roll(tp_od, tp_id, tp_length);
}

module tp_arm(thickness, base_diameter, hub_diameter)
{
	rotate([0, 0, -90])
	{
		union()
		{
			cylinder(r=base_diameter/2, h=thickness);
		
			difference()
			{
				rotate([90, 0, 0])
					linear_extrude(file="arm.dxf", layer="Arm", height=thickness, center=true);
				translate([0,0, 80])
					rotate([90, 0, 0])
						cylinder(r=hub_diameter/2, thickness/2);	

				translate([hub_diameter*0.6, hub_diameter*0.6, 0])
					cylinder(r=2, h=thickness);
				translate([-hub_diameter*0.6, hub_diameter*0.6, 0])
					cylinder(r=2, h=thickness);
				translate([hub_diameter*0.6, -hub_diameter*0.6, 0])
					cylinder(r=2, h=thickness);
				translate([-hub_diameter*0.6, -hub_diameter*0.6, 0])
					cylinder(r=2, h=thickness);

			}
		}
	}
}

module tp_roll(od, id, length)
{
	rotate([0, 90, 0])
	{
		difference()
		{
			cylinder(r=od/2, h=length, center=true);
			cylinder(r=id/2, h=length, center=true);
		}
	}
}

module tp_inner(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness)
{
	union()
	{
		translate([0, 0, tp_length*0.75])
			cylinder(r=(hub_diameter-clearance)/2, h=thickness);

		difference()
		{
			cylinder(r=(tp_id-clearance*3-cylinder_wall*2)/2, h=tp_length*0.75);
			cylinder(r=(tp_id-clearance*3-cylinder_wall*4)/2, h=(tp_length*0.75-cylinder_wall));
		}
	}
}

module tp_outer(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness)
{
	union()
	{
		translate([0, 0, tp_length*0.75])
			cylinder(r=(hub_diameter-clearance)/2, h=thickness);

		difference()
		{
			cylinder(r=(tp_id-clearance)/2, h=tp_length*0.75);
			cylinder(r=(tp_id-clearance-cylinder_wall*2)/2, h=(tp_length*0.75-cylinder_wall));
		}
	}
}


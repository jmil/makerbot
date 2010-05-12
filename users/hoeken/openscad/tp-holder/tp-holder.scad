$fa = 0.3;

tp_assembly();

module tp_assembly()
{
	thickness = 15;
	base_diameter = 61;
	hub_diameter = 25;
	cylinder_wall = 2;
	clearance = 1;

	tp_od = 120;
	tp_id = 42;
	tp_length = 110;

	color([0.5, 0.5, 0.5])
		translate([tp_length/2+thickness*1.25, 0, 0])
			tp_arm(thickness, base_diameter, hub_diameter, tp_od, clearance);
	
	color([0.5, 0.5, 0.5])
		translate([-tp_length/2-thickness*1.25, 0, 0])
			rotate([0, 0, 180])
			tp_arm(thickness, base_diameter, hub_diameter, tp_od, clearance);

	color([1,1,1])
		translate([0, 0, tp_od/2+thickness*1.5])
			tp_roll(tp_od, tp_id, tp_length);

	color([0, 0.5, 0])
	translate([-(tp_length*0.15+thickness), 0, tp_od/2+thickness*1.5])
		rotate([0, 90, 0])
			tp_outer(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness); 

	color([0, 0.5, 0])
	translate([tp_length*0.15+thickness, 0, tp_od/2+thickness*1.5])
		rotate([0, -90, 0])
			tp_inner(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness); 

	//tp_arm(thickness, base_diameter, hub_diameter, tp_od, clearance);
	//tp_inner(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness); 
	//tp_outer(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness); 
	//tp_roll(tp_od, tp_id, tp_length);
}

module tp_arm(thickness, base_diameter, hub_diameter, tp_od, clearance)
{
	rotate([0, 0, -90])
	{
		difference()
		{
			union()
			{
				cylinder(r=base_diameter/2, h=thickness/2);
				translate([0,0,thickness/2])
					cylinder(r2=(hub_diameter+thickness*2)/2, r1=base_diameter/2, h=tp_od/2+thickness);
				translate([0,0,tp_od/2+thickness*1.5])
					sphere(r=(hub_diameter+thickness*2)/2);
			}

			translate([thickness/2, thickness/2, thickness/2])
				cube(size=[base_diameter+1, base_diameter+1, tp_od]);

			rotate([0, 0, 90])
				translate([thickness/2, thickness/2, thickness/2])
					cube(size=[base_diameter+1, base_diameter+1, tp_od]);

			translate([thickness/2+base_diameter/2+0.5, 0, 0])
				rotate([0, 0, 180])
					translate([thickness/2, thickness/2, thickness/2])
						cube(size=[base_diameter+1, base_diameter+1, tp_od]);

			translate([0, 0,tp_od/2+thickness*1.5])
				rotate([90, 0, 0])
					cylinder(r=hub_diameter/2+clearance, h=thickness/2);

			for(i=[0:3])
				rotate([0, 0, 90*i])
				translate([hub_diameter*0.6, hub_diameter*0.6, 0])
					cylinder(r=2, h=thickness/2);
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
		translate([0, 0, tp_length*0.85])
			cylinder(r=(hub_diameter-clearance)/2, h=thickness);

		difference()
		{
			cylinder(r=(tp_id-clearance*3-cylinder_wall*2)/2, h=tp_length*0.85);
			cylinder(r=(tp_id-clearance*3-cylinder_wall*4)/2, h=(tp_length*0.85-cylinder_wall));
		}
	}
}

module tp_outer(tp_id, tp_length, hub_diameter, cylinder_wall, clearance, thickness)
{
	union()
	{
		translate([0, 0, tp_length*0.85])
			cylinder(r=(hub_diameter-clearance)/2, h=thickness);

		difference()
		{
			cylinder(r=(tp_id-clearance)/2, h=tp_length*0.85);
			cylinder(r=(tp_id-clearance-cylinder_wall*2)/2, h=(tp_length*0.85-cylinder_wall));
		}
	}
}


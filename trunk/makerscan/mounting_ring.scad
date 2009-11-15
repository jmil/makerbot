//bracket_ring();
//bracket_block();
mounting_bracket();

thickness = 7;

module mounting_bracket()
{
	union() {
		bracket_ring();
		bracket_block();
	}
}

module bracket_ring()
{
	difference()
	{
		union()
		{
				cylinder(h=thickness,r=17.4, convexity=10);
				translate(v=[14.4,-6,0]) scale(v=[5,12,thickness]) cube(convexity=10);
				translate(v=[-14.4,-5,0]) scale(v=[-10,10,thickness]) cube(convexity=10);	
		}
		cylinder(h=thickness,r=13.4, convexity=10);
		translate(v=[12,-2,0]) scale(v=[16,4,thickness]) cube(convexity=10);
	}
}

module bracket_block()
{
		translate(v=[-(30),-10,0])
		{
			difference()
			{
				cube([thickness, 40, 20]);
				translate([-1, 30, 10]) rotate([0,90,0])scale([1/5,1/5,1/5]) cylinder(h=thickness*5*2, r=1.75*5);
			}
		}
}

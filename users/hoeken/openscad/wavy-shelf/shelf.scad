height=100;

strut(height);

module strut(h)
{
	$fa = 0.3;
	
	difference()
	{
		linear_extrude(file="strut-profile.dxf", layer="Wavy-Hex", height=h, twist=180);
		cylinder(r=1.5, h=10);
		translate([0,0,h-10])
			cylinder(r=1.5, h=10);
	}
}
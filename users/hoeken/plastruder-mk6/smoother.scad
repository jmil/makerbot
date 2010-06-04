nozzleDiameter = 4;
nozzleFacets = 4;
layerHeight = 1;

$fa = 0.5;
$fs = 0.5;
$fn = 30;

ShaperNozzle(nozzleDiameter, nozzleFacets, layerHeight);

module ShaperNozzle(dia, facets, height)
{
	difference()
	{
		cylinder(r=dia/2, h=dia*2);
		//cube(center=true, size=[dia, dia, dia*2]);

		for(i=[0:facets-1])
			rotate([0,0, 360/facets*i])
				translate([dia/2-height, 0, height])
					rotate([0,90/facets*i,0])
						translate([0,-dia/2, -dia/2])														#cube([dia, dia, dia]);
	}
}
woodThickness = 4.5;

sideDistanceX = 42.93;
sideDistanceZ = 69.93;

frostruder();

module frostruder()
{
	backPanel();
	leftPanel();
	rightPanel();

	syringeTop();
	syringeBottom();

	topMount();
	bottomMount();
}

module backPanel()
{
	woodPanel("Back Panel");
}

module leftPanel()
{
	translate([sideDistanceX, 0, sideDistanceZ]) rotate([0, 90,0]) woodPanel("Left Panel");
}

module rightPanel()
{
	translate([-sideDistanceX, 0, sideDistanceZ]) rotate([0, -90,0]) woodPanel("Right Panel");
}

module syringeTop()
{
	translate([0,41,170]) rotate([-90,0,0]) woodPanel("Syringe Top");
}

module syringeBottom()
{
	translate([0,-59,80]) rotate([-90,0,0]) woodPanel("Syringe Bottom");
}

module bottomMount()
{
	translate([0,-(75+woodThickness*2),-155]) rotate([-90,0,0]) woodPanel("Bottom Mount");
}

module topMount()
{
	translate([0,-(75+woodThickness),-245]) rotate([-90,0,0]) woodPanel("Top Mount");
}

module woodPanel(layer, thickness=woodThickness)
{
	dxf_linear_extrude(
		file = "frostruder.dxf",
		layer = layer,
		height = thickness,
		convexity = 10
	);
}
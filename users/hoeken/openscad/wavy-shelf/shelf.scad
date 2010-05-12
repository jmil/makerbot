height=100;

strut(height);

module strut(h)
{
	linear_extrude(file="strut-profile.dxf", layer="Wavy-Hex", height=h, twist=45);
}
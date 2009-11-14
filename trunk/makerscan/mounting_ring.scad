difference() {
	union() {
		cylinder(h=7,r=17.4);
		translate(v=[14.4,-6,0]) scale(v=[5,12,7]) cube();
		translate(v=[-14.4,-5,0]) scale(v=[-10,10,7]) cube();
		intersection() {
			translate(v=[-19.4,-10,0]) scale(v=[-30,20,20]) cube();
			rotate(a=10.0,v=[1,0,0]) {
				translate(v=[-34.4,0,0]) {
					difference() {
						scale(v=[-30,40,25]) {
							cube(center=true);
						}
						translate(v=[6,0,-5])
							cylinder(h=20,r=2.2);
						translate(v=[-6,0,-5])
							cylinder(h=20,r=2.2);
					}
				}
			}
		}
	}
	cylinder(h=7,r=13.4);
	translate(v=[12,-2,0]) scale(v=[16,4,7]) cube();
	
};


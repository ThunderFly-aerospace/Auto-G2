include <../parameters.scad>

// Diameter of the whole holder
diameter = 16;
// Tooth diameter
tooth_diameter = 2.4;

difference(){
	union(){
		cylinder(r=diameter/2, h=3, center=true); 
        cylinder(d=3 * M3_screw_diameter, h = 3 * M3_screw_diameter, $fn = 30);
	}

	for ( i = [0 : 30 : 360] ){
		translate([sin(i)*diameter/2,cos(i)*diameter/2,-3]) cylinder(r=tooth_diameter/2,h=6, $fn=16);
	}

	translate([0,0,-1.5]) 
        cylinder(d = M3_nut_diameter, h = 3 * M3_screw_diameter, $fn=6);
	translate([0,0,3 * M3_screw_diameter -1.5 + layer_height]) 
        cylinder(d = M3_screw_diameter, h=5, $fn=16);
}	

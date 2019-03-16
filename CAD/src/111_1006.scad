include <../parameters.scad>;

blade_screws_distance = (16.47+11.86)/2;
screw_diameter = M2_screw_diameter;
move_index = 4+screw_diameter/2;

points = [
	[0, 0, 0],
	[28.84, 0, 0],
	[26.2, 14, 0],
	[0, 14, 0],
	[0, 0, 1.97],
	[28.84, 0, 1.97],
	[26.2, 14, 1.97],
	[0, 14, 1.97]
];

faces = [
	[0, 1, 2, 3],
	[4, 5, 1, 0],
	[7, 6, 5, 4],
	[5, 6, 2, 1],
	[6, 7, 3, 2],
	[7, 4, 0, 3]
];

difference() {
	union() {
		polyhedron(points, faces);
		translate([move_index, 7, 1.97]) cylinder(d=M2_nut_diameter+2.5, h=M2_nut_height, $fn=40	);
		translate([move_index+blade_screws_distance, 7, 1.97]) cylinder(d=M2_nut_diameter+2.5, h=M2_nut_height, $fn=40);
	}
	translate([move_index, 7, 0]) cylinder(d=screw_diameter, h=2, $fn=20);
	translate([move_index+blade_screws_distance, 7, 0]) cylinder(d=screw_diameter, h=2, $fn=20);
	translate([move_index, 7, 1.97]) cylinder(d=M2_nut_diameter, h=M2_nut_height, $fn=6);
	translate([move_index+blade_screws_distance, 7, 1.97]) cylinder(d=M2_nut_diameter, h=M2_nut_height, $fn=6);
}
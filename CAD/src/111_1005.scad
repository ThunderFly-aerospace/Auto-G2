include <../parameters.scad>;

module 111_1005() {
blade_screws_distance = (16.47+11.86)/2;
screw_diameter = M2_screw_diameter;
move_index = 4+screw_diameter/2;

points = [
	[0, 0, 0],
	[26.15, 0, 0],
	[28.8, 14, 0],
	[0, 14, 0],
	[0, 0, 2.07],
	[25, 0, 2.07],
	[27.4, 14, 2.9],
	[0, 14, 2.9]
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
	polyhedron(points, faces);
	translate([move_index, 7, 0]) cylinder(d=screw_diameter, h=3, $fn=20);
	translate([move_index+blade_screws_distance, 7, 0]) cylinder(d=screw_diameter, h=3, $fn=20);
}
}
111_1005();
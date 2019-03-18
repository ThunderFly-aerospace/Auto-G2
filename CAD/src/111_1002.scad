//// ThunderFly - Rotor Head - Part 2

include <../parameters.scad>

length = rotor_head_width-6-0.5; // Length of the part
space = 1; // Axis hole distance
wall = 1.5;

$fn = 100;

module Part2(){
    difference(){
        hull(){
            translate([-length/2, -(M3_screw_diameter + 2*wall)/2, 0])
                cube([length, M3_screw_diameter + 2*wall, M3_screw_diameter + 2*wall]);
            translate([0, M3_screw_diameter + space, 0])
                cylinder(d = M3_screw_diameter + 2*wall, h = M3_screw_diameter + 2*wall);
        }
    translate([0, M3_screw_diameter + space, -0.1])
        cylinder(d = M3_screw_diameter, h = 100);
    rotate([0, 90, 0])
        translate([-(M3_screw_diameter + 2*wall)/2, 0, -50])
            cylinder(h = 100, d = M3_screw_diameter);
    }
}

Part2();
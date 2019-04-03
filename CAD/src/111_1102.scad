include <../parameters.scad>
use <888_1001.scad>
use <111_1004.scad>
use <111_1005.scad>
use <111_1006.scad>


888_1001();
translate([0, 0, 3]) rotate([0, 0, 90]) 111_1004();
translate([0, 0, -3]) rotate([0, 180, 90+24]) 111_1004();

translate([7, 35, -5]) rotate([0, 180, 90]) 111_1005();
translate([-7, 35, 5]) rotate([0, 0, -90]) 111_1006();

use <111_1001.scad>
use <111_1002.scad>
use <111_1003.scad>


translate([0, 0, 0]) rotate([0, 180, 90]) Part1();

translate([0,0,0]) color("green") rotate([90, 0, 90]) Part2();
translate([-8.9, 0, 4]) rotate([0, -90, 0]) Part3();
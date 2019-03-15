use <111_1001.scad>
use <111_1002.scad>
use <111_1003.scad>



translate([3, 0, -20]) rotate([0, 180, 90]) Part1();

color("green") rotate([90, 0, 90]) Part2();
translate([-5.2, 0, 9]) rotate([0, -90, 0]) Part3();
include <../parameters.scad>
use <111_1009.scad>



translate([0, -10, 0])
    111_1009_print(1);
    111_1009_print(2);

translate([0, 10, 0])
    111_1009_print(3);

translate([60, 6, 0])
rotate([0, 0, 180]){
    translate([0, -10, 0])
        111_1009_print(1);
        111_1009_print(2);
    translate([0, 10, 0])
        111_1009_print(3);
}

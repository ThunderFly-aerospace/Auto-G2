include <../../parameters.scad>
use <../111_1009.scad>

//@set_slicing_config(../../../slicing/fill_fine.ini)

difference(){
    union(){
        translate([0, -5, 0])
            rotate([90, 0, 0])
                111_1009_print(3);

        translate([0, 5, 0])
            rotate([-90, 0, 0])
                111_1009_print(3);

        translate([-5, -5, 0])
            rotate([90, 180, 0])
                111_1009_print(3);

        translate([-5, 5, 0])
            rotate([-90, 180, 0])
                111_1009_print(3);
    }

    translate([-100, -100, 0])
        cube(200);
}

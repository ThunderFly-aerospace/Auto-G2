include <../../parameters.scad>
use <../111_1009.scad>

//@set_modificator(modificator)
//@set_slicing_config(../../slicing/blades/infill_modif.ini, modificator)


translate([0, -20, 0])
    111_1009_print(1);

    111_1009_print(2);

translate([0, 20, 0])
    111_1009_print(3);

translate([60, 12, 0])
rotate([0, 0, 180]){
    translate([0, -20, 0])
        111_1009_print(1);
        111_1009_print(2);
    translate([0, 20, 0])
        111_1009_print(3);
}

module modificator(){
union(){
    translate([0, -20, 0])
        111_1009_print_modificator(1);

        111_1009_print_modificator(2);

    translate([0, 20, 0])
        111_1009_print_modificator(3);

    translate([60, 12, 0])
    rotate([0, 0, 180]){
        translate([0, -20, 0])
            111_1009_print_modificator(1);
            111_1009_print_modificator(2);
        translate([0, 20, 0])
            111_1009_print_modificator(3);
    }
}
}

%modificator();

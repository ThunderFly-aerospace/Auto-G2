include <../../parameters.scad>
use <../111_1009.scad>

//@set_slicing_config(../../../slicing/blades/blade.ini)

//@set_modificator(modificator)
//@set_slicing_config(../../../slicing/blades/infill_modif.ini, modificator)

//set_modificator(modificatorb)
//set_slicing_config(../../../slicing/blades/ends_modif.ini, modificatorb)

//@set_modificator(modificatorc)
//@set_slicing_config(../../../slicing/blades/pipe_modif.ini, modificatorc)


rotate([0, 0, 90]){
111_1009_print(0, rotate = true);

translate([0, -20, 0])
    111_1009_print(1);

translate([0, 20, 0])
111_1009_print(2);

translate([70, 10, 0])
    rotate([0, 0, 180]){
        111_1009_print(0, rotate = true);

        translate([0, 20, 0])
            111_1009_print(1);

        translate([0, -20, 0])
        111_1009_print(2);
    }
}


module modificator(){
rotate([0, 0, 90]){
    111_1009_print(0, rotate = true);

    translate([0, -20, 0])
        111_1009_print_modificator(1);

    translate([0, 20, 0])
    111_1009_print_modificator(2);

    translate([70, 10, 0])
        rotate([0, 0, 180]){
            111_1009_print_modificator(0, rotate = true);

            translate([0, 20, 0])
                111_1009_print_modificator(1);

            translate([0, -20, 0])
            111_1009_print_modificator(2);
        }
}
}


module modificatorb(){
rotate([0, 0, 90]){
    111_1009_print(0, rotate = true);

    translate([0, -20, 0])
        111_1009_end_print_modificator(1);

    translate([0, 20, 0])
    111_1009_end_print_modificator(2);

    translate([70, 10, 0])
        rotate([0, 0, 180]){
            111_1009_end_print_modificator(0, rotate = true);

            translate([0, 20, 0])
                111_1009_end_print_modificator(1);

            translate([0, -20, 0])
            111_1009_end_print_modificator(2);
        }
    }
}

/* module modificatorb(){

    rotate([180, 0, 0])
        translate([0, 20, -rotor_blade_length/3])
            111_1009_end_print_modificator(1);

        111_1009_end_print_modificator(2);

    translate([0, 20, 0])
        111_1009_end_print_modificator(3);

    translate([60, 12, 0])
        rotate([0, 0, 180]){
            rotate([180, 0, 0])
                translate([0, 20, -rotor_blade_length/3])
                    111_1009_end_print_modificator(1);
                111_1009_end_print_modificator(2);
            translate([0, 20, 0])
                111_1009_end_print_modificator(3);
        }
} */


module modificatorc(){
rotate([0, 0, 90]){
    111_1009_pipe_print(0, rotate = true);

    translate([0, -20, 0])
        111_1009_pipe_print_modificator(1);

    translate([0, 20, 0])
    111_1009_pipe_print_modificator(2);

    translate([70, 10, 0])
        rotate([0, 0, 180]){
            111_1009_pipe_print_modificator(0, rotate = true);

            translate([0, 20, 0])
                111_1009_pipe_print_modificator(1);

            translate([0, -20, 0])
            111_1009_pipe_print_modificator(2);
        }
}
}




%modificator();
%modificatorb();
%modificatorc();

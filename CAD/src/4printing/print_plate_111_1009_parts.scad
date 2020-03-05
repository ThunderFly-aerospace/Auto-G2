include <../../parameters.scad>

blade_divisions = [0, rotor_blade_length/3, rotor_blade_length/3*2, rotor_blade_length];
use <../111_1009.scad>

//@set_slicing_config(../slicing/blades/blade.ini)

//@set_modificator(modificator)
//@set_slicing_config(../slicing/blades/infill_modif.ini, modificator)

//@set_modificator(modificatorc)
//@set_slicing_config(../slicing/blades/pipe_modif.ini, modificatorc)


space = 18;

module blade(){
    rotate([180, 0, 0]){
        translate([0, space, rotor_blade_length/3])rotate([180, 0, 0])
            111_1009_print(0);
        translate([0, -space, 0])
            111_1009_print(1);
        111_1009_print(2);
    }
}

blade();
translate([70, space/2, 0]) rotate([0, 0, 180]) blade();

module modificator(){

    rotate([180, 0, 0]){
        translate([0, space, rotor_blade_length/3])rotate([180, 0, 0])
            111_1009_print_modificator(0);
        translate([0, -space, 0])
            111_1009_print_modificator(1);
        111_1009_print_modificator(2);
    }

    translate([70, space/2, 0]) rotate([0, 0, 180])
    rotate([180, 0, 0]){
        translate([0, space, rotor_blade_length/3])rotate([180, 0, 0])
            111_1009_print_modificator(0);
        translate([0, -space, 0])
            111_1009_print_modificator(1);
        111_1009_print_modificator(2);
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

            rotate([180, 0, 0]){
                translate([0, space, rotor_blade_length/3])rotate([180, 0, 0])
                    111_1009_pipe_print_modificator(0);
                translate([0, -space, 0])
                    111_1009_pipe_print_modificator(1);
                111_1009_pipe_print_modificator(2);
            }

            translate([70, space/2, 0]) rotate([0, 0, 180])
            rotate([180, 0, 0]){
                translate([0, space, rotor_blade_length/3])rotate([180, 0, 0])
                    111_1009_pipe_print_modificator(0);
                translate([0, -space, 0])
                    111_1009_pipe_print_modificator(1);
                111_1009_pipe_print_modificator(2);
            }

}

//%modificator();
%modificatorc();

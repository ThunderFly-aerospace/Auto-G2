include <../../parameters.scad>
use <../111_1009.scad>

//@set_modificator(modificator)
//@set_slicing_config(../slicing/blades/infill_modif.ini, modificator)


//@set_modificator(modificatorb)
//@set_slicing_config(../slicing/blades/ends_modif.ini, modificatorb)



    rotate([180, 0, 0])
        translate([0, 0, -rotor_blade_length/3])
            111_1009_print(1);

    translate([60, 12, 0])
        rotate([0, 0, 180])
            rotate([180, 0, 0])
                translate([0, 10, -rotor_blade_length/3])
                    111_1009_print(1);



module modificator(){
    rotate([180, 0, 0])
        translate([0, 0, -rotor_blade_length/3])
            111_1009_print_modificator(1);


    translate([60, 12, 0])
        rotate([0, 0, 180])
            rotate([180, 0, 0])
                translate([0, 10, -rotor_blade_length/3])
                    111_1009_print_modificator(1);
}

module modificatorb(){
    rotate([180, 0, 0])
        translate([0, 0, -rotor_blade_length/3])
            111_1009_end_print_modificator(1);


    translate([60, 12, 0])
        rotate([0, 0, 180])
            rotate([180, 0, 0])
                translate([0, 10, -rotor_blade_length/3])
                    111_1009_end_print_modificator(1);
}

%modificator();
%modificatorb();

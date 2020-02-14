include <../parameters.scad>
use <888_1001.scad>
use <111_1004.scad>
use <111_1005.scad>
use <111_1006.scad>
use <111_1008.scad>
use <111_1009.scad>



module 111_1102(AOA = rotor_blade_AOA){
    888_1001();

    if(rotor_blades_count == 2) {
        translate([0, 0, 3])
            rotate([0, 0, 90])
                111_1004();
        
        translate([0, 0, -3])
            rotate([0, 180, 90+24])
                111_1008();
    }

    else {
        translate([0, 0, 3])
            rotate([0, 0, 120])
                111_1004();
        
        translate([0, 0, -3])
            rotate([0, 180, 120+24])
                111_1008();
    }

    for(i = [0:360/rotor_blades_count:360]) {
        rotate([0, 0, i])
            translate([7, 35, -5])
                rotate([0, 180, 90])
                    111_1005();

        rotate([0, 0, i])
            translate([-7, 35, 5])
                rotate([0, 0, -90])
                    111_1006();

        rotate([0, AOA, i])
            translate([rotor_blade_depth/4, rotor_blade_length+50, 0])
                rotate([90, 180, 0])
                    111_1009();
    }
}


111_1102();
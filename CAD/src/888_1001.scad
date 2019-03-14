
//
// 
//

include <../parameters.scad>

module 888_1001()
{
    angle_between_blades = 360 / rotor_blades_count; 
    rotor_center_plate_size = 30; 
    rotor_mounting_plate_size = 20;
    shaft_diameter = 6; 
    thickness = 2; 

    difference () {
        union () {
            cylinder(d = rotor_center_plate_size, h = thickness, center = true);

            for (i = [0:rotor_blades_count]){ 
                rotate([0,0, i*angle_between_blades])
                    translate([0, 20, 0])
                        cube([10, 30, thickness], center = true);
            }
        }

        cylinder(d = shaft_diameter, h = 2* thickness, center = true);


        for (i = [0:rotor_blades_count]){ 
            rotate([0,0, i*angle_between_blades])
                translate([0, 20, 0])
                    cylinder(d = shaft_diameter, h = 2* thickness, center = true);
        }


    }
}

888_1001();
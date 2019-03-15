
//
//
//

include <../parameters.scad>

module 888_1001()
{
    angle_between_blades = 360 / rotor_blades_count;
    rotor_center_plate_size = 30;
    rotor_mounting_plate_size = 20;
    shaft_diameter = 6.1;
    thickness = 2;
    blade_screws_distance = (16.47+11.86)/2;

    difference () {
        union () {
            cylinder(r = 3+9, h = thickness, center = true, $fn = 100);

            for (i = [0:rotor_blades_count]){
                rotate([0,0, i*angle_between_blades])
                    translate([0, 20, 0])
                        cube([14, 30, thickness], center = true);
            }
        }

        cylinder(d = shaft_diameter, h = 2* thickness, center = true, $fn = 20);


        for (i = [1:rotor_blades_count]){
            rotate([0,0, i*angle_between_blades])
                translate([0, 16 + blade_screws_distance/2, 0]) {
                    translate([0, blade_screws_distance/2, 0])
                        cylinder(d = M2_screw_diameter, h = 2* thickness, center = true, $fn = 20);
                    translate([0, -blade_screws_distance/2, 0])
                        cylinder(d = M2_screw_diameter, h = 2* thickness, center = true, $fn = 20);
                }
        }

        rotate([0,0, rotor_delta_angle])
        for (i = [1:rotor_blades_count]){
            rotate([0,0, i*angle_between_blades + angle_between_blades/2])
                translate([0, 3 + 4.5 + M2_screw_diameter/2, 0])
                    cylinder(d = M2_screw_diameter, h = 2* thickness, center = true, $fn = 20);
        }
    }
}

888_1001();

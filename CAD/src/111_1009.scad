//// ThunderFly Auto-G2 3D printable Rotor blade

/// Rotor blade

draft = true;

include <../parameters.scad>
use <lib/naca4.scad>

rotor_blade_depth_naca_resolution = draft ? 70 : 130;

module base_airfoil(h = rotor_blade_length){
    airfoil(naca = rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution, h = h - blade_transition_length - blade_mount_length, open = false);
}

module blade_shell(){
    hollow_airfoil(naca = rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution, h = rotor_blade_length - blade_transition_length - blade_mount_length, open = false, wall_thickness = blade_shell_thickness);
}


module blade_infill(){
    difference(){
        intersection(){
            base_airfoil();
            union(){
                render(){
                    //cylinder(d=10, h=rotor_blade_length);
                    //translate([40, -10, 0])
                    //    cube([20, 20, 400]);
                    for (i=[0 : blade_infill_distance : rotor_blade_length + rotor_blade_depth]) {
                        translate([0, -25, i])
                            rotate([0, 60, 0])
                                cube([rotor_blade_depth*2, 50, blade_shell_thickness_inner]);
                        translate([rotor_blade_depth/4, -25, i])
                            rotate([0, 90+30, 0])
                                cube([rotor_blade_depth*2, 50, blade_shell_thickness_inner]);
                    }
                }
            }
        }
        blade_shell();
    }
}


module blade_mount(){
    translate([rotor_blade_depth/4, 0, rotor_blade_length - blade_mount_length])
        difference(){
            union(){
                translate([-blade_mount_width/2, -blade_mount_thickness/2, -1])
                    cube([blade_mount_width, blade_mount_thickness, blade_mount_length + 1]);

                hull(){
                    translate([-rotor_blade_depth/4, 0, - blade_transition_length])
                        linear_extrude(height = 0.1)
                            polygon(points = airfoil_data(naca=rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution));

                    translate([-blade_mount_width/2, -blade_mount_thickness/2, -1])
                        cube([blade_mount_width, blade_mount_thickness, blade_mount_length/2]);
                }
            }

            translate([0, 20, blade_mount_length -blade_mount_screw_offset])
                rotate([90, 0, 0])
                    cylinder(d = blade_mount_screw, h=40, $fn = 50);
            translate([0, 20, blade_mount_length -blade_mount_screw_offset -blade_mount_screw_distance])
                rotate([90, 0, 0])
                    cylinder(d = blade_mount_screw, h=40, $fn = 50);

        }

        /* hull(){
            translate([0, 0, rotor_blade_length - blade_transition_length - blade_mount_length])
                linear_extrude(height = 0.1)
                    polygon(points = airfoil_data(naca=rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution));

            #translate([rotor_blade_depth/4 -blade_mount_width/2, -blade_mount_thickness/2, rotor_blade_length - blade_transition_length - blade_mount_length/4])
                cube([blade_mount_width, blade_mount_thickness, blade_mount_length/4]);
        } */
}


module 111_1009(){
    difference(){
        union(){
            blade_infill();
            blade_shell();
            blade_mount();
            if (rotor_blade_rod){
                translate(blade_rod1_position)
                    cylinder(d = blade_rod1_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
                translate(blade_rod2_position)
                    cylinder(d = blade_rod2_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
                translate(blade_rod3_position)
                    cylinder(d = blade_rod3_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
            }
        }

        // diry na vyztuhu
        if (rotor_blade_rod){
            translate(blade_rod1_position - [0, 0, 0.5])
                cylinder(d = blade_rod1_diameter, h = rotor_blade_length + 1, $fn = 50);
            translate(blade_rod2_position - [0, 0, 0.5])
                cylinder(d = blade_rod2_diameter, h = rotor_blade_length + 1, $fn = 50);
            translate(blade_rod3_position - [0, 0, 0.5])
                cylinder(d = blade_rod3_diameter, h = rotor_blade_length + 1, $fn = 50);
        }
    }
}


module 111_1009_print(part = 1){
    height = rotor_blade_length;
    part_height = height/rotor_blade_parts_count;
    bottom  = part_height*(part-1);

    translate([0, 0, -bottom])
    difference(){
        union(){
            intersection(){
                blade_infill();
                translate([0, -25, bottom + blade_infill_overlap])
                    cube([rotor_blade_depth, 50, part_height]);
            }
            intersection(){
                union(){
                    blade_shell();
                    blade_mount();
                    if (rotor_blade_rod){
                        translate(blade_rod1_position)
                            cylinder(d = blade_rod1_diameter + blade_shell_thickness_wire*2, h = rotor_blade_length, $fn = 50);
                        translate(blade_rod2_position)
                            cylinder(d = blade_rod2_diameter + blade_shell_thickness_wire*2, h = rotor_blade_length, $fn = 50);
                        translate(blade_rod3_position)
                            cylinder(d = blade_rod3_diameter + blade_shell_thickness_wire*2, h = rotor_blade_length, $fn = 50);
                    }
                }
                translate([0, -25, bottom])
                    cube([rotor_blade_depth, 50, part_height]);
            }
        }


        // diry na vyztuhu
        if (rotor_blade_rod){
            translate(blade_rod1_position - [0, 0, 0.5])
                cylinder(d = blade_rod1_diameter, h = rotor_blade_length + blade_mount_length + 1, $fn = 50);
            translate(blade_rod2_position - [0, 0, 0.5])
                cylinder(d = blade_rod2_diameter, h = rotor_blade_length + blade_mount_length + 1, $fn = 50);
            translate(blade_rod3_position - [0, 0, 0.5])
                cylinder(d = blade_rod3_diameter, h = rotor_blade_length + blade_mount_length + 1, $fn = 50);

            translate(blade_rod1_position + [0, 0, part_height + bottom])
                cylinder(d = blade_rod1_diameter + blade_shell_thickness_wire*2, h = rotor_blade_length + blade_mount_length - 1, $fn = 50);
            translate(blade_rod2_position + [0, 0, part_height + bottom])
                cylinder(d = blade_rod2_diameter + blade_shell_thickness_wire*2, h = rotor_blade_length + blade_mount_length - 1, $fn = 50);
            translate(blade_rod3_position + [0, 0, part_height + bottom])
                cylinder(d = blade_rod3_diameter + blade_shell_thickness_wire*2, h = rotor_blade_length + blade_mount_length - 1, $fn = 50);
        }
    }
}

111_1009();

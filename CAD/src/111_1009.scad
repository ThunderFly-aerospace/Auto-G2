//// ThunderFly Auto-G2 3D printable Rotor blade

/// Rotor blade

rotor_blade_depth_naca_resolution = draft ? 100 : 200;

include <../parameters.scad>
use <lib/naca4.scad>



module base_airfoil(h = rotor_blade_length){
    airfoil(naca = rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution, h = h - blade_transition_length, open = false);
}

module blade_shell(){
    hollow_airfoil(naca = rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution, h = rotor_blade_length - blade_transition_length, open = false);
}


module blade_infill(){
    difference(){
        intersection(){
            base_airfoil();
            union(){
            for (i=[0 : blade_infill_distance : rotor_blade_length + rotor_blade_depth]) {
                translate([0, -25, i])
                    rotate([0, 60, 0])
                        cube([rotor_blade_depth*2, 50, blade_shell_thickness_inner]);
                translate([rotor_blade_depth, -25, i])
                    rotate([0, 90+30, 0])
                        cube([rotor_blade_depth*2, 50, blade_shell_thickness_inner]);
            }}
        }
        blade_shell();
    }
}

module blade_mount(){
    translate([rotor_blade_depth/4, 0, rotor_blade_length])
        difference(){
            translate([-blade_mount_width/2, -blade_mount_thickness/2, -1])
                cube([blade_mount_width, blade_mount_thickness, blade_mount_length + 1]);

            translate([0, 20, blade_mount_length -blade_mount_screw_offset])
                rotate([90, 0, 0])
                    cylinder(d = blade_mount_screw, h=40, $fn = 50);
            translate([0, 20, blade_mount_length -blade_mount_screw_offset -blade_mount_screw_distance])
                rotate([90, 0, 0])
                    cylinder(d = blade_mount_screw, h=40, $fn = 50);
        }

        hull(){
            translate([0, 0, rotor_blade_length - blade_transition_length])
                linear_extrude(height = 0.1)
                    polygon(points = airfoil_data(naca=rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution));

            #translate([rotor_blade_depth/4 -blade_mount_width/2, -blade_mount_thickness/2, rotor_blade_length])
                cube([blade_mount_width, blade_mount_thickness, blade_mount_length/4]);

        }
}


module 111_1009(){
    difference(){
        union(){
            blade_infill();
            blade_shell();
            blade_mount();
            translate(blade_rod_position)
                cylinder(d = blade_rod_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
            translate(blade_rod_position2)
                cylinder(d = blade_rod_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
        }

        // diry na vyztuhu
        translate(blade_rod_position)
            cylinder(d = blade_rod_diameter, h = rotor_blade_length+0.1, $fn = 50);
        translate(blade_rod_position2)
            cylinder(d = blade_rod_diameter, h = rotor_blade_length+0.1, $fn = 50);
    }
}


module 111_1009_print(part = 1){
    height = rotor_blade_length + blade_mount_length;
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
                    translate(blade_rod_position)
                        cylinder(d = blade_rod_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
                    translate(blade_rod_position2)
                        cylinder(d = blade_rod_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
                }
                translate([0, -25, bottom])
                    cube([rotor_blade_depth, 50, part_height]);
            }
        }

        // diry na vyztuhu
        translate(blade_rod_position)
            cylinder(d = blade_rod_diameter, h = rotor_blade_length+0.1, $fn = 50);
        translate(blade_rod_position2)
            cylinder(d = blade_rod_diameter, h = rotor_blade_length+0.1, $fn = 50);
    }
}

111_1009();
//base_airfoil();


        /* rotate([0,0,90])
            difference()
            {
                linear_extrude(height = 150)
                polygon(points = airfoil_data(naca=0030, L = 140));
            } */

            //hollow_airfoil(naca = rotor_blade_naca, L = 150, N = draft ? 50 : 100, h = 150, open = false); //dutý profil

//hollow_airfoil(naca = 0007, L = 95, N = draft ? 50 : 100, h = 152, open = true, wall_thickness);

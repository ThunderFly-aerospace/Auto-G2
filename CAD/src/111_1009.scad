//// ThunderFly Auto-G2 3D printable Rotor blade

/// Rotor blade

include <../parameters.scad>
use <lib/naca4.scad>

module base_airfoil(h = rotor_blade_length){
    intersection(){
        render(){
            airfoil(naca = rotor_blade_naca, L = rotor_blade_depth, N=25, h = h, open = false);
        }
        blade_outer_shape();
    }
}

module blade_outer_shape(){
    hull(){
        translate([0, -10, 0])
            cube([rotor_blade_depth, 20, blade_shell_thickness]);
        translate([0, -10, rotor_blade_length - blade_transition_length])
            cube([rotor_blade_depth, 20, blade_shell_thickness_inner]);
        translate([0, -10, rotor_blade_length])
            cube([blade_mount_width, 20, blade_shell_thickness]);
    }
}

module blade_shell(){
    intersection(){
        minkowski(){
            difference(){
                translate([-25, -25, -0.05])
                    cube([rotor_blade_depth + 50, 50, rotor_blade_length+10]);
                translate([0, 0, blade_shell_thickness])
                    base_airfoil();
            }
            sphere(d = blade_shell_thickness * 2);
        }
        base_airfoil(h = rotor_blade_length+1);
    }
}



module blade_infill(){
    intersection(){
        base_airfoil();
        union(){
        for (i=[0 : blade_infill_distance : rotor_blade_length + rotor_blade_depth]) {
            translate([0, -25, i])
                rotate([0, 45, 0])
                    cube([rotor_blade_depth*2, 50, blade_shell_thickness_inner]);
            translate([rotor_blade_depth, -25, i])
                rotate([0, 45*3, 0])
                    cube([rotor_blade_depth*2, 50, blade_shell_thickness_inner]);
        }}

    }

}

module blade_mount(){
    translate([0, 0, rotor_blade_length])
        difference(){
            translate([0, -blade_mount_thickness/2, -1])
                cube([blade_mount_width, blade_mount_thickness, blade_mount_length + 1]);

            translate([blade_mount_width/2, 20, blade_mount_length -blade_mount_screw_offset])
                rotate([90, 0, 0])
                    cylinder(d = blade_mount_screw, h=40, $fn = 50);
            translate([blade_mount_width/2, 20, blade_mount_length -blade_mount_screw_offset -blade_mount_screw_distance])
                rotate([90, 0, 0])
                    cylinder(d = blade_mount_screw, h=40, $fn = 50);
        }
}


module 111_1009(){
    difference(){
        union(){
            blade_shell();
            blade_infill();
            blade_mount();
            intersection(){
                union(){
                    translate(blade_rod_position)
                        cylinder(d = blade_rod_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
                    translate(blade_rod_position2)
                        cylinder(d = blade_rod_diameter + blade_shell_thickness_inner*2, h = rotor_blade_length, $fn = 50);
                }
                blade_outer_shape();
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

//blade_shell();

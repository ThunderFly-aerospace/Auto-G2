//// ThunderFly Auto-G2 3D printable Rotor blade
/// Rotor blade

//@set_slicing_config(../../slicing/blades/blade.ini)

//@set_modificator(111_1009_modificator)
//@set_slicing_config(../../slicing/blades/infill_modif.ini, 111_1009_modificator)

//@set_modificator(111_1009_pipe_modificator)
//@set_slicing_config(../../slicing/blades/pipe_modif.ini, 111_1009_pipe_modificator)

draft = true;

include <../parameters.scad>
use <../lib/naca4.scad>

rotor_blade_depth_naca_resolution = draft ? 50 : 100;

module base_airfoil(h = rotor_blade_length){
    airfoil(naca = rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution, h = h - blade_transition_length - blade_mount_length, open = false);
}

module blade_shell(thickness = blade_shell_thickness){
    hollow_airfoil(naca = rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution, h = rotor_blade_length - blade_transition_length - blade_mount_length, open = false, wall_thickness = thickness);
}


module blade_infill(){
    difference(){
        intersection(){
            union(){
                 for (i=[10 : blade_infill_distance : rotor_blade_length + rotor_blade_depth]) {
                    translate([rotor_blade_depth/4, -10, i])
                        rotate([0, -30, 0])
                            cube([rotor_blade_depth/3 + 2, 20, blade_shell_thickness_inner]);

                    //translate([rotor_blade_depth/4, -10, i])
                    //    rotate([0, 90+30, 0])
                    //        cube([rotor_blade_depth, 20, blade_shell_thickness_inner]);

                    translate([rotor_blade_depth/4, -10, i + blade_infill_distance/2])
                        rotate([0, -30, 0])
                            cube([rotor_blade_depth/3*2 - 5, 20, blade_shell_thickness_inner]);
                }


            }
            base_airfoil();
        }
        blade_shell(thickness = 0.7);
    }
}


module blade_mount(){
    translate([rotor_blade_depth/4, 0, rotor_blade_length - blade_mount_length])
        difference(){
            union(){
                translate([-blade_mount_width/2 - blade_mount_offset, -blade_mount_thickness/2 , -1])
                    cube([blade_mount_width, blade_mount_thickness, blade_mount_length + 1]);

                    hull(){
                        translate([-rotor_blade_depth/4, -blade_mount_thickness/2, - blade_transition_length + 5])
                            cube([50, blade_mount_thickness, 1]);

                        translate([-blade_mount_width/2 - blade_mount_offset, -blade_mount_thickness/2, -1])
                            cube([blade_mount_width, blade_mount_thickness, blade_mount_length/2]);
                    }

                hull(){
                    translate([-rotor_blade_depth/4, 0, - blade_transition_length])
                        linear_extrude(height = 0.1)
                            polygon(points = airfoil_data(naca=rotor_blade_naca, L = rotor_blade_depth, N = rotor_blade_depth_naca_resolution));

                    translate([-rotor_blade_depth/4, -blade_mount_thickness/2, - blade_transition_length + 5])
                        cube([50, blade_mount_thickness, 1]);
                    //translate([-blade_mount_width/2 - blade_mount_offset, -blade_mount_thickness/2, -1])
                    //    cube([blade_mount_width, blade_mount_thickness, blade_mount_length/2]);
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
            base_airfoil();
            blade_mount();
        }

        blade_infill();

        // diry na vyztuhu
        if (rotor_blade_rod) translate([0, 0, 8]){
            translate(blade_rod2_position - [0, 0, 0.5])
                cylinder(d = blade_rod2_diameter, h = rotor_blade_length + 1, $fn = 50);
            translate(blade_rod3_position - [0, 0, 0.5])
                cylinder(d = blade_rod3_diameter, h = rotor_blade_length + 1, $fn = 50);

            translate((blade_rod2_position+blade_rod3_position)/2 + [0, 0, rotor_blade_length -25])
            difference(){
                //#sphere(10);
                rotate([90, 0, 0])
                    rotate_extrude()
                        translate([(blade_rod2_position[0]-blade_rod3_position[0])/2, 0, 0])
                            circle(d = blade_rod2_diameter, $fn = 70);
                        //cylinder(d = blade_rod2_diameter, h=1, center=true);

                translate([-10, -10, -20])
                    cube(20);
            }
        }

        for(i = [40:40:rotor_blade_length-20])
            translate(blade_rod3_position - [0, 0, 20 - i])
                rotate([90, 0, 0])
                    cylinder(d = 1.5, h = 20, $fn = 50, center = true);

        for(i = [40:40:rotor_blade_length-20])
            translate(blade_rod2_position - [0, 0, 20 - i+20])
                rotate([90, 0, 0])
                    cylinder(d = 1.5, h = 20, $fn = 50, center = true);


        rotor_blade_endtip_diameter = 20;

        difference(){
            cube([100, 30, 30], center = true);
                translate([0, rotor_blade_endtip_diameter/2-4, rotor_balde_tip_cutoff+1.8])
                    rotate([10, 0, 0])
                        rotate([0, 90, 0])
                            scale([1.8, 1, 1])
                                cylinder(d = rotor_blade_endtip_diameter, h = rotor_blade_depth, $fn = 100);
        }

        translate([rotor_blade_depth-2, -10, -1])
            cube([20, 20, rotor_blade_length+2]);
    }

}

module 111_1009_modificator(){

    translate([-rotor_blade_depth/4*3, -5, 0])
        cube([rotor_blade_depth, 10, rotor_blade_length]);

    hull(){
        translate([0, -5, rotor_blade_length-10])
            cube([rotor_blade_depth/2, 10, 10]);

        translate([-rotor_blade_depth/4*3, -5, rotor_blade_length-2 - 60])
            cube([rotor_blade_depth, 10, 2]);
    }
}


module 111_1009_end_modificator(){

    translate([0, -5, 0])
        cube([rotor_blade_depth, 10, rotor_balde_tip_cutoff]);

    translate([0, -5, rotor_blade_length-2])
        cube([rotor_blade_depth/2, 10, 2]);
}

module 111_1009_pipe_modificator(){

    translate(blade_rod3_position - [0, 0, -8])
        cylinder(d = 3, h = rotor_blade_length, $fn = 20);

    for(i = [40:40:rotor_blade_length-15])
        translate(blade_rod3_position - [0, 0, 20 - i])
            rotate([90, 0, 0])
                cylinder(d = 1.9, h = 20, $fn = 50, center = true);
}

%111_1009_modificator();
%111_1009_end_modificator();
%111_1009_pipe_modificator();


module 111_1009_print(part = 1, rotate = False){
    height = rotor_blade_length;
    part_height = blade_divisions[part+1] - blade_divisions[part];
    bottom = blade_divisions[part];

    rotate([180, 0, 0])
    translate([0, 0, -bottom - part_height])
    intersection(){

        111_1009();

        translate([0, -25, bottom])
            cube([rotor_blade_depth, 50, part_height]);
        }
}
module 111_1009_print_modificator(part = 1){
    height = rotor_blade_length;
    part_height = blade_divisions[part+1] - blade_divisions[part];
    bottom = blade_divisions[part];

    rotate([180, 0, 0])
        translate([0, 0, -bottom - part_height])
            111_1009_modificator();

}


module 111_1009_end_print_modificator(part = 1){
    height = rotor_blade_length;
    part_height = blade_divisions[part+1] - blade_divisions[part];
    bottom = blade_divisions[part];

    rotate([180, 0, 0])
        translate([0, 0, -bottom - part_height])
        111_1009_end_modificator();

}

module 111_1009_pipe_print_modificator(part = 1){
    height = rotor_blade_length;
    part_height = blade_divisions[part+1] - blade_divisions[part];
    bottom = blade_divisions[part];

    rotate([180, 0, 0])
        translate([0, 0, -bottom - part_height])
        111_1009_pipe_modificator();

}

111_1009();

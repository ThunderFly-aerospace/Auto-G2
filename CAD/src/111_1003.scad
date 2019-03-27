//// ThunderFly - Rotor Head - Part 3

/// Main parameters

include <../parameters.scad>
$fn = 100;

space = 1; // parametr z dilu 1002, rika tloustku steny

bearing_z = -bearing_shaft_length/2;

// Uhel 15 stupnu
//bearing_shaft_shift = 0;

// Uhel 10.02 stupnu
bearing_shaft_shift = 16;


rotor_shaft_angle = 10;

rod_size = 8; // delka hrany sloupku

Bwall = 1.5; // wall around bearing

BaseThickness = 1;
BaseBoldDiameter = M3_screw_diameter;
BaseBoldHeadDiameter = M3_nut_diameter + 0.5;
BaseBoldHeadHeight = M3_nut_height;


// nastaveni delek tahel
rod_x_dist = 30;
rod_y_distance = 60;


rod_x_distance = rod_x_dist - rod_size/2 - BaseThickness - M3_screw_diameter/2 - space;


module Part3(){
    
    // Vypocet uhlu
    rotor_plane_space = 6; // Vzdalenost od loziska k rovine rotoru (je to predevsim vzdalenost dvou maticek)
    
    bearing_shaft_shift = ((rod_size/2 + BaseThickness + M3_screw_diameter/2 + space)/tan(rotor_shaft_angle)) - bearing_shaft_length - rotor_plane_space;
    echo(bearing_shaft_shift);
    
    
    translate([0, 0, -bearing_outer_diameter/2 - Bwall])
    difference(){
    union(){
        hull(){
           translate([-rod_size/2, 0, bearing_outer_diameter/2 + Bwall]) rotate([0, 90, 0])
                cylinder(d = bearing_outer_diameter + Bwall*2, h = bearing_shaft_length + bearing_shaft_shift + rod_size/2);
           translate([-rod_size/2, -bearing_outer_diameter/2 - Bwall, -BaseThickness])
                cube([bearing_shaft_length + bearing_shaft_shift + rod_size/2, bearing_outer_diameter + Bwall*2, bearing_outer_diameter/2 + Bwall]);
        }
        //hull(){
        //    translate([0, 0, -BaseThickness])
        //        cylinder(d = BaseBoldHeadDiameter + Bwall*2, h = BaseThickness);
        //}


        // sloupky
        hull(){
            translate([0, 0, -BaseThickness+3])
                cube([rod_size, rod_size, 1], center = true);
            
            translate([0, rod_y_distance/2 - rod_size/4 , rod_x_distance + rod_size/2])
                cube([rod_size, rod_size/2, rod_size],center = true);
        }

        hull(){
            translate([0, 0, -BaseThickness+3])
                cube([rod_size, rod_size, 1],center = true);
            translate([0 , -rod_y_distance/2 + rod_size/4, rod_x_distance + rod_size/2])
                cube([rod_size, rod_size/2, rod_size],center = true);
        }
    }


   translate([bearing_thickness + bearing_shaft_shift - 0.1 - 100, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = bearing_outer_diameter, h = bearing_thickness + 100);

   translate([-50, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = 4, h = 100);

   translate([bearing_shaft_shift + bearing_shaft_length - bearing_thickness, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = bearing_outer_diameter, h = bearing_thickness + 0.1 + 100);

    // Bolt holes
    translate([0, 0, -BaseThickness])
        cylinder(d = BaseBoldDiameter, h = BaseThickness+10);

    translate([0, 0, 2])
        cylinder(d = BaseBoldHeadDiameter, h = 100);


    // diry v sloupku pro pridelai kuloveho drzaku pro tahlo
    translate([0, 0, rod_x_distance + rod_size/2])
        rotate([90, 0, 0])
            translate([0, 0, -100])
                cylinder(d = M2_screw_diameter, h=200);
    
    translate([0, 0, rod_x_distance + rod_size/2])
        rotate([90, 0, 0])
            translate([0, 0, rod_y_distance/2 - 10 - Bwall])
                cylinder(d = M2_nut_diameter, h=10, $fn=6);
   
    translate([0, 0, rod_x_distance + rod_size/2])
        rotate([90, 0, 0])
            translate([0, 0, -rod_y_distance/2 + Bwall])
                cylinder(d = M2_nut_diameter, h=10, $fn=6);
    
    }
}


Part3();

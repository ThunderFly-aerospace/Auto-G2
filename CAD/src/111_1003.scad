//// ThunderFly - Rotor Head - Part 3

/// Main parameters

include <../parameters.scad>
$fn = 100;

space = 1; // parametr z dilu 1002, rika tloustku steny

rotor_shaft_angle = 10;

rod_size = 8; // delka hrany sloupku
Bwall = 1.5; // wall around bearing

BaseThickness = 0;
BaseBoldDiameter = M3_screw_diameter;
BaseBoldHeadDiameter = M3_nut_diameter + 0.5;
BaseBoldHeadHeight = M3_nut_height;

bearing_inner_diameter = 7;

// nastaveni delek tahel
rod_x_dist = 30;

rod_y_distance = rod_x_dist*2 - 3*2; // 3 je delka kuloveho cepu
rod_x_distance = rod_x_dist - rod_size/2 - BaseThickness - M3_screw_diameter/2 - space;


module Part3(){
    
    // Vypocet uhlu
    rotor_plane_space = 7; // Vzdalenost od loziska k rovine rotoru (je to predevsim vzdalenost dvou maticek)
    
    bearing_shaft_shift = ((rod_size/2 + BaseThickness + M3_screw_diameter/2 + space)/tan(rotor_shaft_angle)) - bearing_shaft_length - rotor_plane_space;
    echo(bearing_shaft_shift);
    
    
    translate([0, 0, -bearing_outer_diameter/2 - Bwall])
    difference(){
    union(){
        //hull(){
           translate([-rod_size/2, 0, bearing_outer_diameter/2 + Bwall]) rotate([0, 90, 0])
                cylinder(d = bearing_outer_diameter + Bwall*2, h = bearing_shaft_length + bearing_shaft_shift + rod_size/2);
    //       translate([-rod_size/2, -bearing_outer_diameter/2 - Bwall, -BaseThickness])
    //            cube([bearing_shaft_length + bearing_shaft_shift + rod_size/2, bearing_outer_diameter + Bwall*2, bearing_outer_diameter/2 + Bwall]);
            
           translate([-rod_size/2, -bearing_outer_diameter/2 - Bwall, -BaseThickness])
                cube([bearing_outer_diameter, bearing_outer_diameter + Bwall*2, bearing_outer_diameter + Bwall*2+3]);
        //}


        // sloupky
        hull(){
            translate([0, 0, -BaseThickness+2])
                cube([rod_size, rod_size, 1], center = true);
            
            translate([0, rod_y_distance/2 - rod_size/4 , rod_x_distance + rod_size/2])
                cube([rod_size, rod_size/2, rod_size],center = true);
        }

        hull(){
            translate([0, 0, -BaseThickness+2])
                cube([rod_size, rod_size, 1],center = true);
            translate([0 , -rod_y_distance/2 + rod_size/4, rod_x_distance + rod_size/2])
                cube([rod_size, rod_size/2, rod_size],center = true);
        }
    }


  // Zapusteni pro loziska
   translate([bearing_shaft_shift + bearing_shaft_length - bearing_shaft_length + bearing_thickness - 100, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = bearing_outer_diameter, h = 100);

   translate([bearing_shaft_shift + bearing_shaft_length - bearing_shaft_length + bearing_thickness + layer_thickness, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = bearing_inner_diameter, h = 100);

   translate([bearing_shaft_shift + bearing_shaft_length - bearing_thickness, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = bearing_outer_diameter, h = bearing_thickness + 0.1 + 100);

   // Dira pro ROLL osu.
    translate([0, 0, -10])
        cylinder(d = M3_screw_diameter, h = 100);

    //translate([0, 0, bearing_outer_diameter + Bwall*2])
    //    cylinder(d = M3_nut_diameter, h = 100);
    
    // podlozka pod hlavu sroubu
    translate([0, 0, bearing_outer_diameter + Bwall*2+1])
        cylinder(d = 9, h = 5);


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

difference(){
Part3();
//translate([-50, 0, 0]) cube(100);
}

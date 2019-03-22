//// ThunderFly - Rotor Head - Part 3

/// Main parameters

include <../parameters.scad>
$fn = 100;


rod_x_distance = 20;
rod_y_distance = 60/2 + 13;

sloupek_z = -8;
bearing_z = -15;

rod_size = 6.5;

Bwall = 1.5; // wall around bearing

BaseThickness = 5;
BaseBoldDiameter = M3_screw_diameter;
BaseBoldHeadDiameter = 7.2;
BaseBoldHeadHeight = 3;


module Part3(){
    translate([5, 0, -bearing_outer_diameter/2 - Bwall])
    difference(){
    union(){
        hull(){
           translate([bearing_z, 0, bearing_outer_diameter/2 + Bwall]) rotate([0, 90, 0])
                cylinder(d = bearing_outer_diameter + Bwall*2, h = bearing_shaft_length);
           translate([bearing_z, -bearing_outer_diameter/2 - Bwall, -BaseThickness])
                cube([bearing_shaft_length, bearing_outer_diameter + Bwall*2, bearing_outer_diameter/2 + Bwall]);
        }
        hull(){

            translate([-5, 0, -BaseThickness])
                cylinder(d = BaseBoldHeadDiameter + Bwall*2, h = BaseThickness);
        }


        // sloupky
        hull(){
            translate([sloupek_z, -2, -BaseThickness])
                cube([rod_size, rod_size, 1]);
            translate([sloupek_z + rod_size/2, rod_y_distance/2, rod_x_distance + rod_size/2])
                cube([rod_size, rod_size/2, rod_size],center = true);
        }

        hull(){
            translate([sloupek_z, -rod_size+2, -BaseThickness])
                cube([rod_size, rod_size, 1]);
            translate([sloupek_z + rod_size/2, -rod_y_distance/2-rod_size, rod_x_distance + rod_size/2])
                cube([rod_size, rod_size/2,  rod_size ],center = true);
        }
    }


   translate([bearing_z-5, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = bearing_outer_diameter, h = bearing_thickness + 5);

    translate([bearing_z, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = 4, h = 100);

   translate([bearing_z+bearing_shaft_length - bearing_thickness, 0, bearing_outer_diameter/2 + Bwall])
        rotate([0, 90, 0])
            cylinder(d = bearing_outer_diameter, h = bearing_thickness + 10);

    // Bolt holes
    translate([-5, 0, -BaseThickness])
        cylinder(d = BaseBoldDiameter, h = BaseThickness+0.2);

    translate([-5, 0, -BaseBoldHeadHeight])
        cylinder(d = BaseBoldHeadDiameter, h = 100);


    // diry v sloupku pro pridelai kuloveho drzaku pro tahlo
    translate([sloupek_z + rod_size/2, 0, rod_x_distance + rod_size/2])
        rotate([90, 0, 0])
            translate([0, 0, -100])
                cylinder(d = M2_screw_diameter, h=200);
    
    translate([sloupek_z + rod_size/2, 0, rod_x_distance + rod_size/2])
        rotate([90, 0, 0])
            translate([0, 0, rod_y_distance/2])
                cylinder(d = M2_nut_diameter, h=10, $fn=6, center = true);
   
    translate([sloupek_z + rod_size/2, 0, rod_x_distance + rod_size/2])
        rotate([90, 0, 0])
            translate([0, 0, -rod_y_distance/2])
                %cylinder(d = M2_nut_diameter, h=10, $fn=6, center = true);
    
    }
}


Part3();

//// ThunderFly - Rotor Head - Part 3

/// Main parameters

include <parameters.scad>
$fn = 100;


rod_x_distance = 20;
rod_y_distance = 30;

rod_size = 6.5;

Bwall = 1.5; // wall around bearing

BaseThickness = 5;
BaseBoldDiameter = 3.2;
BaseBoldHeadDiameter = 8.2;
BaseBoldHeadHeight = 3;


module Part3(){
    difference(){
    union(){
        hull(){
           translate([0, 0, bearing_outer_diameter/2 + Bwall]) rotate([0, 90, 0])
                cylinder(d = bearing_outer_diameter + Bwall*2, h = bearing_shaft_length + bearing_thickness);
           translate([0, -bearing_outer_diameter/2 - Bwall, -BaseThickness])
                cube([bearing_shaft_length + bearing_thickness, bearing_outer_diameter + Bwall*2, bearing_outer_diameter/2 + Bwall]);
        }
        hull(){
            translate([0, -bearing_outer_diameter/2 - Bwall, -BaseThickness])
                cube([bearing_shaft_length + bearing_thickness, bearing_outer_diameter + Bwall*2, BaseThickness]);
            translate([-10, 0, -BaseThickness])
                cylinder(d = BaseBoldHeadDiameter + Bwall*2, h = BaseThickness);
        }
        
        hull(){
            translate([bearing_shaft_length/2, 0, -BaseThickness])
                cube([rod_size, rod_size, 1]);
            translate([bearing_shaft_length/2, rod_y_distance/2, rod_x_distance])
                cube([rod_size, rod_size, rod_size]);
        }
        
        hull(){
            translate([bearing_shaft_length/2, -rod_size, -BaseThickness])
                cube([rod_size, rod_size, 1]);
            translate([bearing_shaft_length/2, -rod_y_distance/2-rod_size, rod_x_distance])
                cube([rod_size, rod_size, rod_size]);
        }
    }
    
    
   translate([0, 0, bearing_outer_diameter/2 + Bwall]) rotate([0, 90, 0])
        cylinder(d = bearing_outer_diameter, h = bearing_thickness);
   
    translate([0, 0, bearing_outer_diameter/2 + Bwall]) rotate([0, 90, 0])
        cylinder(d = 3.2, h = 100);
    
   translate([bearing_shaft_length, 0, bearing_outer_diameter/2 + Bwall]) rotate([0, 90, 0])
        cylinder(d = bearing_outer_diameter, h = bearing_thickness);
    
    // Bolt holes
    translate([-10, 0, -BaseThickness])
        cylinder(d = BaseBoldDiameter, h = BaseThickness+0.2);
    
    translate([-10, 0, -BaseBoldHeadHeight])
        cylinder(d = BaseBoldHeadDiameter, h = BaseThickness+0.2);
    
    
    translate([bearing_shaft_length/2 + rod_size/2, 0, rod_x_distance + rod_size/2])
        rotate([90, 0, 0])
            translate([0, 0, -100])
                cylinder(d=M2_5_screw_diameter, h=200);
    translate([bearing_shaft_length/2 + rod_size/2 - 5.2/2, rod_y_distance/2+1, rod_x_distance + rod_size/2 - 3])
        cube([5.2, 2.5, 100]);
    translate([bearing_shaft_length/2 + rod_size/2 - 5.2/2, -rod_y_distance/2-2.5-1, rod_x_distance + rod_size/2 - 3])
        cube([5.2, 2.5, 100]);
    
    }
}


Part3();
//// ThunderFly Auto-G2 Rotor Head - Part 1

/// Main parameters

include <../parameters.scad>

L1 = rotor_head_width;  // Length of the middle part
T1 = rotorhead_wall_thickness;  // Thickness of the middle wall
T2 = rotorhead_wall_thickness;  // Thickness of the side walls
H = 23;  // Hight of the part
L2 = 28;  // Length of the side walls

/// Parameters for holes
RC = M3_screw_diameter/2;  // Radius of the center screw holes
RP = M2_screw_diameter/2;  // Radius of the periphery screw holes
DY = horizontal_screw_distance;  // Y-axis distance of the periphery screw holes
DZ = vertical_screw_distance;  // Z-axis distance of the periphery screw holes

shift =  - 15;
CHT = [0, shift, -20];  // Center hole translation

/// Parameters for the cutout
LC = 0; // Length of the cutout
HC = 0;  // Hight of the cutout

fn = 100;  // default face number for cylinders
/// Main object

module body() {
    translate([0,-T1/2, 0]) difference() {
        union(){
            translate([0, 0, 0])
                cube([L1, L2, H], center= true);
            hull(){
                translate([0, -L2/4, -vertical_screw_distance/2 - topscrew_distance_endofpilon])
                    cube([L1, L2/2, 0.1], center= true);
                translate(CHT+[0, T1/2, 0])
                    rotate([0,90,0])
                        cylinder(r=RC+2, h=L1+4, center = true, $fn=fn);

            }
            
            
            hull(){
                translate([0, 0, 0])
                    cube([L1, L2, H-6], center= true);
                translate(CHT+[0, 6, 7])
                    rotate([0,90,0])
                        cylinder(r=RC+2, h=L1, center = true, $fn=fn);

            }

        }
        translate([0,0,0])
            cube([L1-2*T2, L2-T1, H*10], center = true);
        
        translate([0,0,-50])
            cube([L1-2*T2, 50, 100], center = true);
    }

}



/// Part 1 with holes and incisions
module Part1(){
    translate(-CHT){
        difference(){
        body();
           // Screw holes
            translate(CHT) rotate([0,90,0]) cylinder(r=RC, h=L1+10, center = true, $fn=fn);
            rotate([0,90,0]) translate([DZ/2,DY/2,0]) cylinder(r=RP, h=L1+2, center = true, $fn=fn);
            rotate([0,90,0]) translate([-DZ/2,DY/2,0]) cylinder(r=RP, h=L1+2, center = true, $fn=fn);
            rotate([0,90,0]) translate([DZ/2,-DY/2,0]) cylinder(r=RP, h=L1+2, center = true, $fn=fn);
            rotate([0,90,0]) translate([-DZ/2,-DY/2,0]) cylinder(r=RP, h=L1+2, center = true, $fn=fn);
            
           // Zapusteni pro matky
            rotate([0,90,0]) translate([DZ/2,DY/2,0]) cylinder(d=M2_nut_diameter, h=L1-2*T2+1, center = true, $fn=6);
            rotate([0,90,0]) translate([-DZ/2,DY/2,0]) cylinder(d=M2_nut_diameter, h=L1-2*T2+1, center = true, $fn=6);
            rotate([0,90,0]) translate([DZ/2,-DY/2,0]) cylinder(d=M2_nut_diameter, h=L1-2*T2+1, center = true, $fn=6);
            rotate([0,90,0]) translate([-DZ/2,-DY/2,0]) cylinder(d=M2_nut_diameter, h=L1-2*T2+1, center = true, $fn=6);

           // Cutout in the middle wall
            #translate([0,0,H/2-HC/2]) cube([LC, L2+10, HC], center = true);

        }
    }
}

Part1();

//// ThunderFly Auto-G2 Rotor Head - Part 1

/// Main parameters

include <../parameters.scad>

L1 = 21.4;  // Length of the middle part
T1 = 1.5;  // Thickness of the middle wall
T2 = 2;  // Thickness of the side walls
H = 20;  // Hight of the part
L2 = 28;  // Length of the side walls

/// Parameters for holes
RC = M3_screw_diameter/2;  // Radius of the center screw holes
RP = M2_screw_diameter/2;  // Radius of the periphery screw holes
DY = 14.5;  // Y-axis distance of the periphery screw holes
DZ = 12;  // Z-axis distance of the periphery screw holes

CHT = [0, 0, -20];  // Center hole translation

/// Parameters for the cutout
LC = 0; // Length of the cutout
HC = 0;  // Hight of the cutout

fn = 100;  // default face number for cylinders
/// Main object

module body() {
    translate([0,-T1/2,0]) difference() {
        union(){
            cube([L1, L2, H], center= true);
            hull(){
                translate([0, T1/2, 0])
                    cube([L1, L2-T1, H], center= true);
                translate(CHT+[0, T1/2, 0]) rotate([0,90,0]) cylinder(r=RC+2, h=L1, center = true, $fn=fn);

            }

        }
        translate([0,T1,0])
            cube([L1-2*T2, L2, H*10], center = true);
    }

}



/// Part 1 with holes and incisions
module Part1(){
    difference(){
    body();
       // Screw holes
        translate(CHT) rotate([0,90,0]) cylinder(r=RC, h=L1+2, center = true, $fn=fn);
        rotate([0,90,0]) translate([DZ/2,DY/2,0]) cylinder(r=RP, h=L1+2, center = true, $fn=fn);
        rotate([0,90,0]) translate([-DZ/2,DY/2,0]) cylinder(r=RP, h=L1+2, center = true, $fn=fn);
        rotate([0,90,0]) translate([DZ/2,-DY/2,0]) cylinder(r=RP, h=L1+2, center = true, $fn=fn);
        rotate([0,90,0]) translate([-DZ/2,-DY/2,0]) cylinder(r=RP, h=L1+2, center = true, $fn=fn);

       // Cutout in the middle wall
        translate([0,0,H/2-HC/2]) cube([LC, L2+10, HC], center = true);

    }
}

Part1();

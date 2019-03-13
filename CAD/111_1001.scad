//// ThunderFly - Rotor Head - Part 1

/// Main parameters

L1 = 21.4;  // Length of the middle part
T1 = 2;  // Thickness of the middle wall
T2 = 3;  // Thickness of the side walls
H = 20;  // Hight of the part
L2 = 28;  // Length of the side walls

/// Parameters for holes
RC = 3/2 + 0.2;  // Radius of the center screw holes
RP = 3/2 + 0.2;  // Radius of the periphery screw holes
DY = 14.5;  // Y-axis distance of the periphery screw holes
DZ = 12;  // Z-axis distance of the periphery screw holes

CHT = [0, 0, -4];  // Center hole translation

/// Parameters for the cutout
LC = 10; // Length of the cutout
HC = 5;  // Hight of the cutout

fn = 100;  // default face number for cylinders
/// Main object

module body() {
    translate([0,-T1/2,0]) difference() {
        cube([L1, L2, H], center= true);
        translate([0,T1,0])
            cube([L1-2*T2, L2, H], center = true);
    }
    
}



/// Part 1 with holes and incisions

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
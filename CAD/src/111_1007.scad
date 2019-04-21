include<../parameters.scad>

servo_height = 23.2;
servo_width = 12.2;
distance = 3;

difference() {
    cube([servo_width+2, servo_height+10, distance]);
    union() {
        translate([1, 5, -0.05]) cube([servo_width+2, servo_height, distance+0.1]);
        hull() {
            translate([(servo_width+2)/2, 2.5, 0]) cylinder(d=Servo_screw, h=distance, $fn=20);
            translate([(servo_width+2)/2, 0, distance/2]) cube([Servo_screw, Servo_screw, distance], center=true);
        }
        hull() {
            translate([(servo_width+2)/2, servo_height+7.5, 0]) cylinder(d=Servo_screw, h=distance, $fn=20);
            translate([(servo_width+2)/2, servo_height+10, distance/2]) cube([Servo_screw, Servo_screw, distance], center=true);
        }
    }
}
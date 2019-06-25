include <../parameters.scad>

//rozměry spodní spojovací části
connecting_part_thickness = 2;
connecting_part_lenght = 40; //délka spojovací části bez držáku na servo

//rozměry hlavní kostky s osou
cube_width = 16;
cube_height = 14;
cube_lenght = 20;
cube_side_thickness = 2;

hole_for_rope_height = cube_height-4;

//rozměry serva
servo_height = 24.5;
servo_width = 23;
servo_lenght = 12;

//rozměry držáku na servo
servo_holder_mount_width = (M2_nut_diameter)*1.5;

servo_holder_height = servo_height/2;
//servo_holder_height = servo_height*2/3;
servo_holder_lenght = servo_lenght;
servo_holder_width = servo_width + 2*servo_holder_mount_width;

module 888_1010 () {
    //spodní spojovací část
    cube([connecting_part_lenght, cube_width, connecting_part_thickness]);


    translate([connecting_part_lenght-cube_lenght, 0, 0]) {

        difference() {
            //hlavní kostka s osou
          cube([cube_lenght, cube_width, cube_height]);

          translate([cube_side_thickness, cube_side_thickness, cube_side_thickness])
              cube([cube_lenght-cube_side_thickness+1, cube_width-cube_side_thickness*2, cube_height-cube_side_thickness+1]);

          translate([cube_lenght*2/3, cube_width+1, cube_height/2+cube_side_thickness])
              rotate ([90, 0, 0])
                  cylinder(h=cube_width+2, d=M3_screw_diameter, $fn=50);

          translate([-1, cube_width/2 , hole_for_rope_height])
              rotate ([0,90,0])
                  hull () {
                      //otvor pro drát
                      translate ([5,0,0]) cylinder (h=cube_side_thickness+2, d=2, $fn=50);
                      cylinder(h=cube_side_thickness+2, d=2, $fn=50);
                  }
      }
    }

    //držák serva
    translate([-servo_holder_lenght, -servo_holder_mount_width+servo_holder_mount_width/2-M2_screw_diameter/2, 0]) {
        difference() {
            union() {
                cube([servo_holder_lenght, servo_holder_width, connecting_part_thickness]);
                cube([servo_holder_lenght, servo_holder_width, servo_holder_height+connecting_part_thickness]);
            }
            translate([-1, servo_holder_mount_width, connecting_part_thickness])
                cube([servo_holder_lenght+2, servo_width, servo_holder_height+connecting_part_thickness+1]);

            //otvory pro šrouby
            translate([servo_lenght/2, servo_holder_mount_width/2, -servo_holder_height/10])
                cylinder(d=M2_screw_diameter, h=2*servo_holder_height, $fn=50);
            translate([servo_lenght/2, servo_holder_width-servo_holder_mount_width/2, -servo_holder_height/10])
                cylinder(d=M2_screw_diameter, h=2*servo_holder_height, $fn=50);

            //otvory pro matice
            translate([servo_lenght/2, servo_holder_width-servo_holder_mount_width/2, -1])
                cylinder (d=M2_nut_diameter, h=servo_holder_height-4, $fn=6);
            translate([servo_lenght/2, servo_holder_mount_width/2, -1])
                cylinder (d=M2_nut_diameter, h=servo_holder_height-4, $fn=6);
        }
    }
}

888_1010() ;

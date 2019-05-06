include<../../parameters.scad>
use <../111_1009.scad>

p_lenght = rotor_blade_length + blade_mount_length;
part = 1;

intersection(){
    111_1009();
    translate([0, -25, p_lenght/3*(part-1)])
        cube([100, 50, p_lenght/3]);
}

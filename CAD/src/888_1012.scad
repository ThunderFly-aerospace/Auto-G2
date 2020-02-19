//@set_slicing_config(../../slicing/hard.ini)

tail_gear_holder_gear_length = 20;
tail_gear_holder_tail_length = 23;
tail_gear_holder_cube = 10;

tail_pipe_inner_diameter = 8;

$fn = 50;

module 888_1012(){

    difference(){
        union(){
            translate([-tail_pipe_inner_diameter/2, -tail_gear_holder_cube/2, 0])
                cube([tail_gear_holder_gear_length, tail_gear_holder_cube, tail_gear_holder_cube]);

            cylinder(d = tail_pipe_inner_diameter, h = tail_gear_holder_tail_length);
        }

        translate([0, 0, tail_gear_holder_cube/2])
            rotate([0, 90, 0])
                cylinder(d = 2.5+0.4, h = 40, center = true);

            translate([-5, -(10-0.8)/2, 0])
                cube([6, 10-0.8, 9]);

    }

}

888_1012();

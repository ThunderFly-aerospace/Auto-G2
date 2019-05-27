include <../parameters.scad>

module 888_1010() {
    difference() {
        union() {
            cylinder(d1=tow_ring_diameter, d2=tow_ring_diameter-tow_ring_groove, h=tow_ring_thickness/2, $fn=50);
            translate([0, 0, tow_ring_thickness/2])
                cylinder(d1=tow_ring_diameter-tow_ring_groove, d2=tow_ring_diameter, h=tow_ring_thickness/2, $fn=50);
        }

        translate([0, 0, -0.1])
        cylinder(d=tow_ring_hole, h=tow_ring_thickness+0.2, $fn=20);
    }
}

888_1010();
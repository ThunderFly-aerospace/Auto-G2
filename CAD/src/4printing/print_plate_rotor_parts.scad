use <../888_1001.scad>
use <../111_1004.scad>
use <../111_1005.scad>
use <../111_1006.scad>
use <../111_1008.scad>

use <../lib/stdlib/shortcuts.scad>

place_in_rect(35, 35) // arange that stuff in a grid
{
    111_1008();
    111_1004();

    111_1006();
    111_1006();

}

translate([10, -35, 0])
    rotate(90)
        888_1001();

translate([0, 45, 0])
    rotate(90)
        888_1001();

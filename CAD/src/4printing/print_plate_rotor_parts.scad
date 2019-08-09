use <../111_1004.scad>
use <../111_1005.scad>
use <../111_1006.scad>
use <../111_1008.scad>

use <../lib/stdlib/shortcuts.scad>

place_in_rect(35, 30) // arange that stuff in a grid
{
    111_1008();

    111_1005();
    111_1005();

    111_1004();

    111_1006();
    111_1006();

}

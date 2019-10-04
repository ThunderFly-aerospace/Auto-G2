use <../888_1001.scad>
use <../lib/stdlib/shortcuts.scad>

safety_hole = 0;

place_in_rect(30, 80) // arange that stuff in a grid
{
    888_1001(hole_diameter = safety_hole);
    888_1001(hole_diameter = safety_hole);

    888_1001(hole_diameter = safety_hole);
    888_1001(hole_diameter = safety_hole);

    888_1001(hole_diameter = safety_hole);
    888_1001(hole_diameter = safety_hole);

}

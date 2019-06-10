include<../parameters.scad>
use <111_1009.scad>


translate([0, -10, 0])
    111_1009_print(1);
    111_1009_print(2);
    
translate([0, 10, 0])
    111_1009_print(3);

translate ([65, -5, 0])
    mirror([1,0,0]) 111_1009_print(1);

translate ([65, 5, 0])
    mirror([1, 0, 0]) 111_1009_print(2);

translate ([65, 15, 0])
    mirror([1, 0, 0]) 111_1009_print(3);

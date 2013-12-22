use <../writer.scad>;
include <../fonts/default_font.scad>;

write("All of your base",default_font,size=[3,6,1],center=true);

translate([0,-40,0])
	write("are belong to us.",default_font,size=[6,3,1],center=true)
		cube([6,2,1]);

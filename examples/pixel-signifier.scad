use <../writer.scad>;
include <../fonts/kim.scad>;
include <../fonts/default_font.scad>;


for( pix=[[".",1],["-",2],["+",3],["=",4],["E",5],["#",6]] )
	write("?",kim,center=true,size=[7,7,1],pixel_signifier=pix[0])
		cylinder(r=pix[1],h=1,$fn=4);

translate([0,-310,0])
	write("dresdencodak.com",default_font,size=[7,7,1],center=true)
		cube([7,5,1]);

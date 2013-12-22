use <../writer.scad>;
include <../fonts/kim.scad>;


for( pix=[[".",1],["-",2],["+",3],["=",4],["E",5],["#",6]] )
	write("?",kim,center=true,size=[7,7,1],pixel_signifier=pix[0])
		cylinder(r=pix[1],h=1,$fn=4);


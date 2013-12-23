use <writer.scad>;
include <fonts/default_font.scad>;
include <fonts/cabinet.scad>;

// simple ascii
text1 = " 127.0.0.1, sweet 127.0.0.1 ";
font1 = cabinet ;
pixel1 = "1";

// unicode texts must be defined as vector
text2 = [" ","n","o","n","A","S","C","I","I","™"];  
font2 = default_font;
pixel2 = " ";
fallback2 = "*"; // fallback for unknown charaacters. Make sure this chrarcter is contained in your font. Default "?".


/*
Simple usage.
*/
translate([0,35,0])
	write( text1, font1, [4,4,1], height = 20, center = true, pixel_signifier = pixel1 );

/*
Specify something else to be the pixel.
*/
write(text2,font2,[3,3,1] , center=true , pixel_signifier = pixel2 , fallback_char=fallback2 ) {
	cube([3.1,2,10],center=true);
	cube([6,0.2,10],center=true);
}

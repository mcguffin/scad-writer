##OpenSCAD Writer##

Write Text with pixel based fonts in OpenSCAD.

###Usage###
####Importing####
```
use </path/to/writer.scad>;
import </path/to/font_file.scad>;
```

####Syntax####
```
write( text, font, size=[10,10,1] , center=false , pixel_signifier = "1" , fallback_char = "?" );
```

```
write( text, font, size=[10,10,1] , center=false , pixel_signifier = "1" , fallback_char = "?" )
	child();
```

#####write() Arguments#####
`text`: String or Vector containing the caracters as single elements. Use vector if your text contains multibyte characters.
`font`: The font vector. Should match the vector specified in yout font file.
`size`: Size vector. Specifies width and height of the pixel matrix to use. Will also be used 
`center`: Boolean. Center the text object.
`pixel_signifier`: Which character in your font definition is marking a pixel.
`fallback_char`: Which character to display, if the actual char is not found in font definition

###Examples###
####General usage####
```
// import writer
use <writer.scad>;
// import font
include <fonts/default_font.scad>;

write("Some Text",default_font);
```
![](examples/general.png)

####Sizing####


####Write with child objects####
```
use <../writer.scad>;
include <../fonts/default_font.scad>;

write("Some Text",default_font,center=true)
	cylinder(r=6,h=2);
```
![](examples/use-child.png)

####Multibyte Characters####
```
use <../writer.scad>;
include <../fonts/default_font.scad>;

unicode_text = ["›","U","n","i","c","o","d","e","™","‹"];

write( unicode_text , default_font , center=true );
```
![](examples/unicode.png)

####Playing around with pixel sigifiers####
```
use <../writer.scad>;
include <../fonts/kim.scad>;


for( pix=[[".",1],["-",2],["+",3],["=",4],["E",5],["#",6]] )
	write("?",kim,center=true,size=[7,7,1],pixel_signifier=pix[0])
		cylinder(r=pix[1],h=1,$fn=4);

// visit http://dresdencodak.com/
```
![](examples/pixel-signifier.png)

Have a look in /fonts/kim.scad.


###Defining Fonts###
Fonts are defined as 

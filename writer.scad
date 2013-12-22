

/*
_ascii = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
_ansi = "€ ‚ƒ„…†‡ˆ‰Š‹Œ Ž  ‘’“”•–—˜™š›œ žŸ ¡¢£¤¥¦§¨©«¬ ®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";

*/
// to do: define fallback character


module write(text,font,size=[10,10,1] , center=false , pixel_signifier = "1" , fallback_char = "?" ) {
	matrix = charmatrix( text[0] , font , fallback_char );
	font_height = len(matrix); 
	
	move = center ? [-textwidth( text, font, fallback_char = fallback_char ) * size[0]/2 , -font_height*size[1]/2 , -size[2]/2 ] : [0,0,0];
	translate(move)
		for ( i = [0:len(text)-1] ) {
			translate([charpos( text , i , font , fallback_char = fallback_char )*size[0],0,0])
				draw_char(text[i],font,size,pixel_signifier,fallback_char)
					if ( $children > 0 ) {
						children();
					} else {
						cube(size);
					}
		}
}

module draw_char( char , font , size=[10,10] , pixel_signifier = "1" , fallback_char = "?" ) {
	matrix = charmatrix(char , font , fallback_char );
	font_height = len(matrix); 
	union() {
		for ( y = [0:len(matrix)-1] ) 
			for ( x = [0:charwidth( char , font , fallback_char )-1] ) {
			
				if ( matrix[y][x] == pixel_signifier )
					translate([x*size[0],(font_height-y-1)*size[1],0])
						children();
			}
	}
}


function charstruct( char , font , fallback_char = "?" ) 
	= ( (font[ search( [char] , font )[0] ] == undef) ? charstruct(fallback_char,font) : font[ search( [char] , font )[0] ] );
	
function charmatrix( char , font , fallback_char = "?" ) 
	= charstruct( char , font , fallback_char )[1];
	
function charwidth( char , font , fallback_char = "?" ) 
	= len(charmatrix( char , font , fallback_char )[0]);
	
function charpos( text , index , font , pos=0 , fallback_char = "?" ) 
	= ( index==0 ? pos : charpos( text , index-1 , font , pos + charwidth( text[index-1] , font , fallback_char ) , fallback_char ) );

// return pixel width of text
function textwidth( text , font , width = 0 , index = 0 , fallback_char = "?" ) 
	= ( index==len(text) ? width : textwidth( text , font , width + charwidth( text[index] , font , fallback_char ) , index+1) );

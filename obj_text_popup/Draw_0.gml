// Set the font for drawing text to font_main
draw_set_font(fnt_main);

// Set the text alignment for drawing to the middle
// horizontally and the middle vertically.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Set the drawing color to black.
draw_set_colour(c_black);
draw_set_alpha(1);

// Start a for loop for drawing the text outline.
// we initialise a temporary variable _i to 0, increment
// it by 1 each time the loop runs, and finish the loop
// when _i reaches 8.
for(var _i = 0; _i < 8; _i += 1) {
	// Draw the value of the variable my_text at the current
	// x and y position of the instance, but use the functions
	// lengthdir_x and lengthdir_y to offset the text as this 
	// will create the outline effect.
	draw_text(x + lengthdir_x(2,_i*45), y + lengthdir_y(2,_i*45),  + string(my_text));
}

// Set the drawing color to white.
draw_set_colour(c_white);
draw_set_alpha(1);

// Draw the value of the variable my_text at the current
// x and y position of this instance.
draw_text(x + 0, y + 0,  + string(my_text));
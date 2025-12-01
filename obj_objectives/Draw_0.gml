// Draw the object's srpite, this is the panel sprite.
draw_self();

// Change draw color.
draw_set_colour($093F68);
draw_set_alpha(1);

// Change font.
draw_set_font(fnt_big_text);

// Draw "MENU" at the top of the panel.
draw_text(x + 165, y + 70, string("MENU") + "");

// Change font again!
draw_set_font(fnt_main);

// We use this "_y_offset" variable to decide at what y
// position we start drawing the objectives.
// This value is different depending on if we have 1, 2
// or 3 objectives. The default value is for is we have 3
// objectives.
var _y_offset = 120;

// If we DON'T have a second objective, then we must have
// just ONE objective...
if(type_1 == -1)
{
	// Change _y_offet. This should be the middle
	// of the panel.
	_y_offset += 190;
}

// Else we DO have a second objective...
else
{
	// But we DON'T have a third objective...
	if(type_2 == -1)
	{
		// Then we must have just 2 objectives!
		_y_offset += 190 / 2;
	}
}

// If objective 1 is available....
if(type_0 != -1)
{
	// Draw the objective token, using the type variable
	// for objective 1 as the image index.
	draw_sprite(spr_objective_tokens, type_0, x + 70, y + _y_offset);

	// If the amount of tokens still required is over 0...
	if(amount_0 > 0)
	{
		// Draw text showing the number of tokens
		// still required for objective 1.
		draw_value_bordered("x", amount_0, x + 70 + 170, y + _y_offset + 70);
	}

	// Else there's no more tokens left to get for this objective...
	else
	{
		// So draw a tick to show we completed the objective!
		draw_sprite(spr_tick, 0, x + 70 + 160, y + _y_offset + 70);
	}

	// Add 190 to _y_offset so that the next objective is drawn 190 pixels
	// below the one we just draw.
	_y_offset += 190;
}

// If objective 2 is available....
if(type_1 != -1)
{
	// Draw a decorative sprite between objectives 1 and 2.
	draw_sprite_ext(spr_decal, 0, x + 50 + 115, y + _y_offset - 20, 0.8, 0.8, 0, c_white, 1);

	// Draw the objective token, using the type variable
	// for objective 2 as the image index.
	draw_sprite(spr_objective_tokens, type_1, x + 70, y + _y_offset);

	// If the amount of tokens still required is over 0...
	if(amount_1 > 0)
	{
		// Draw text showing the number of tokens
		// still required for objective 2.
		draw_value_bordered("x", amount_1, x + 70 + 170, y + _y_offset + 70);
	}

	// Else there's no more tokens left to get for this objective...
	else
	{
		// So draw a tick to show we completed the objective!
		draw_sprite(spr_tick, 0, x + 70 + 170, y + _y_offset + 70);
	}

	// Add 190 to _y_offset so that the next objective is drawn 190 pixels
	// below the one we just draw.
	_y_offset += 190;
}

// If objective 2 is available....
if(type_2 != -1)
{
	// Draw a decorative sprite between objectives 2 and 3.
	draw_sprite_ext(spr_decal, 0, x + 50 + 115, y + _y_offset - 20, 0.8, 0.8, 0, c_white, 1);

	// Draw the objective token, using the type variable
	// for objective 3 as the image index.
	draw_sprite(spr_objective_tokens, type_2, x + 70, y + _y_offset);

	// If the amount of tokens still required is over 0...
	if(amount_2 > 0)
	{
		// Draw text showing the number of tokens
		// still required for objective 3.
		draw_value_bordered("x", amount_2, x + 70 + 170, y + _y_offset + 70);
	}

	// Else there's no more tokens left to get for this objective...
	else
	{
		// So draw a tick to show we completed the objective!
		draw_sprite(spr_tick, 0, x + 70 + 160, y + _y_offset + 70);
	}
}

// Draw the moves remaining icon.
draw_sprite_ext(spr_moves_icon, 0, x + 130, y + 685, 0.8, 0.8, 0, c_white, 1);

// Change draw color.
draw_set_colour($093F68);
draw_set_alpha(1);

// Change font again!
draw_set_font(fnt_score);

// Draw the number of moves available.
draw_text(x + 205, y + 690,  + string(global.moves_available));
// Draw the panel sprite.
draw_self();

// Change color.
draw_set_colour($093F68);
draw_set_alpha(1);

// Change font.
draw_set_font(fnt_big_text);

// Draw "MENU" at the top of the panel.
draw_text(x + 428, y + 70, string("MENU") + "");

// Change font.
draw_set_font(fnt_main);

// We use this "_x_offset" variable to decide at what x
// position we start drawing the objectives.
// This value is different depending on if we have 1, 2
// or 3 objectives. The default value is for is we have 3
// objectives.
var _x_offset = 120;

// If we DON'T have a second objective, then we must have
// just ONE objective...
if(obj_objectives.type_1 == -1)
{
	// Change _x_offet. This should be the middle
	// of the panel.
	_x_offset += 190;
}

// Else we DO have a second objective...
else
{
	// But we DON'T have a third objective...
	if(obj_objectives.type_2 == -1)
	{
		// Then we must have just 2 objectives!
		_x_offset += 190 / 2;
	}
}

// If objective 1 is available....
if(obj_objectives.type_0 != -1)
{
	// Draw the objective token, using the type variable
	// for objective 1 as the image index.
	draw_sprite(spr_objective_tokens, obj_objectives.type_0, x + _x_offset + 50, y + 100);

	// If the amount of tokens still required is over 0...
	if(obj_objectives.amount_0 > 0)
	{
		// Draw text showing the number of tokens
		// still required for objective 1.
		draw_value_bordered("x", obj_objectives.amount_0, x + _x_offset + 80 + 50, y + 70 + 160);
	}

	// Else there's no more tokens left to get for this objective...
	else
	{
		// So draw a tick to show we completed the objective!
		draw_sprite(spr_tick, 0, x + _x_offset + 80 + 50, y + 70 + 145);
	}

	// Add 190 to _y_offset so that the next objective is drawn 190 pixels
	// below the one we just draw.
	_x_offset += 190;
}

// If objective 2 is available....
if(obj_objectives.type_1 != -1)
{
	// Draw the objective token, using the type variable
	// for objective 2 as the image index.
	draw_sprite(spr_objective_tokens, obj_objectives.type_1, x + _x_offset + 50, y + 100);

	// If the amount of tokens still required is over 0...
	if(obj_objectives.amount_1 > 0)
	{
		// Draw text showing the number of tokens
		// still required for objective 2.
		draw_value_bordered("x", obj_objectives.amount_1, x + _x_offset + 80 + 50, y + 70 + 160);
	}

	// Else there's no more tokens left to get for this objective...
	else
	{
		draw_sprite(spr_tick, 0, x + _x_offset + 80 + 50, y + 70 + 145);
	}

	// Add 190 to _x_offset so that the next objective is drawn 190 pixels
	// below the one we just draw.
	_x_offset += 190;
}

// If objective 2 is available....
if(obj_objectives.type_2 != -1)
{
	// Draw the objective token, using the type variable
	// for objective 3 as the image index.
	draw_sprite(spr_objective_tokens, obj_objectives.type_2, x + _x_offset + 50, y + 100);

	// If the amount of tokens still required is over 0...
	if(obj_objectives.amount_2 > 0)
	{
		// Draw text showing the number of tokens
		// still required for objective 3.
		draw_value_bordered("x", obj_objectives.amount_2, x + _x_offset + 80 + 50, y + 70 + 160);
	}

	// Else there's no more tokens left to get for this objective...
	else
	{
		// So draw a tick to show we completed the objective!
		draw_sprite(spr_tick, 0, x + _x_offset + 80 + 50, y + 70 + 145);
	}
}
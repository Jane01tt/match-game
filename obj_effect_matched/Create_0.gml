// Set the animation speed to zero so this doesn't
// cycle through all the frames of its sprite. It is
// set to have the correct image_index in the "destroy"
// event of obj_matching_piece
image_speed = 0;

// We need to delay some code
// by a single frame because it relies on the image_index
// being set to the correct frame, which happens after
// the Create Event of this object executes.
var _matched_effect = function()
{
	// Only execute the following code if obj_game_over_win does
	// NOT exist (which means this object has been destroyed because
	// a match was created, not because the player won the game).
	var _game_over = instance_exists(obj_game_over_win);
	if(!_game_over)
	{
		// Use a switch statement to perform different actions
		// based on the image_index of this object
		var _my_color = c_white;
		switch(image_index)
		{
			// If the image_index is 0...
			case 0:
				_my_color = c_red;
				break;
	
			// If the image_index is 1...
			case 1:
				_my_color = c_yellow;
				break;
	
			// If the image_index is 2...
			case 2:
				_my_color = c_green;
				break;
	
			// If the image_index is 3...
			case 3:
				_my_color = c_aqua;
				break;
	
			// If the image_index is 4...
			case 4:
				_my_color = c_purple;
				break;
	
			// If the image_index is 5...
			case 5:
				_my_color = c_olive;
				break;
		}

		// Create a particle effect below the current object at
		// position 0,0 (relative to this object).
		// Notice the color of the effect is set to the _my_color
		// temporary variable we declared in the switch statement
		// above.
		// This will make the particle effect color the same as
		// the color of the sprite.
		effect_create_below(3, x + 0, y + 0, 1, _my_color);
	}	
}

_ts_matched_effect = time_source_create(time_source_game, 1, time_source_units_frames, _matched_effect);

time_source_start(_ts_matched_effect);
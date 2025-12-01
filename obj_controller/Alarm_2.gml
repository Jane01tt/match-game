// This alarm is triggered in User Event 0 of obj_matching_piece. If the move the player
// just made was invalid (_i.e. it created no matching line) this code will tell the pieces
// involved to swap back.
if(global.matched_this_turn == 0)
{
	// Play a sound effect indicating that the
	// last move was invalid.
	audio_play_sound(snd_invalid_match, 0, 0);

	// Eliminate the player's multiplier by setting the variable
	// score_combo back to 0, since they made a mistake.
	global.score_combo = 0;

	// Apply the following code to all instances of obj_matching_piece
	with(obj_matching_piece) 
	{
		// If the swap_parent variable is not equal to noone,
		// _i.e. if it has been set to the id of another matching
		// piece...
		if(!(swap_parent == noone))
		{
			// Set the target_x for this piece to the x of the
			// object it needs to swap back with
			target_x = swap_parent.x;
		
			// Set the target_y for this piece to the y of the
			// object it needs to swap back with
			target_y = swap_parent.y;
		
			// Reset the variable swap_parent to noone
			swap_parent = noone;
		}
	}

	// For this object, obj_controller, set alarm[1] to 15. This will give the objects
	// above time to swap back, so if you change their animation speed in the step
	// event you will need to change this value.
	// Alarm[1] resets the turn so the player can have another try.
	alarm_set(1, 15);
}

else
{
	// Because the player performed a valid move, we need
	// to reduce the number of moves available.
	// Here we reduce the global variable moves_available by 1.
	global.moves_available += -1;
}
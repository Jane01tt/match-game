// Set a variable that will tell this object whether or not
// to allow the player to take their next turn at the end of 
// this event (for example, if no blocks fell this turn).
reset_turn = 1;

// Run the following code for every instance of obj_matching_piece
with(obj_matching_piece) 
{
	// If the piece fell this turn...
	if(fell_this_turn == 1)
	{
		// Checks for matches.
		check_for_matches();
	}
}

// If reset_turn is still set to 1 because no objects fell this turn
// or no matches were found for objects that fell.
if(reset_turn == 1)
{
	// Check if, after the last turn, the player has
	// exhausted all of their available moves.
	if(global.moves_available <= 0)
	{
		// Create the sequence which shows a window
		// telling the user they have failed the
		// level.
		layer_sequence_create("UIElements1", room_width / 2, (room_height / 2) - 200, seq_game_over_lose);
	}

	// The player has not yet exhausted all of their moves...
	else
	{
		// Run a script which checks if it is possible for the
		// player to make a valid move on the next turn.
		check_board_valid();
	
		// If global.valid_moves is greater than or equal to 1,
		// there are valid moves left on the board.
		if(global.valid_moves >= 1)
		{
			// All animations and calculations have finished for the 
			// previous move, we set global.can_swap to 1 so the player
			// will be able to take their next turn.
			global.can_swap = 1;
		
			// Reset the global.matched_this_turn variable to 0 since
			// the turn is over and we'll need to set this value again
			// based on the player's next move.
			global.matched_this_turn = 0;
		
			// The following code applies to all instances of
			// obj_matching_piece
			with(obj_matching_piece) 
			{
				// Reset the fell_this_turn variable
				// to 0, since we have finished checking
				// for matches
				fell_this_turn = 0;
			
				// Reset the swap_parent variable to noone,
				// since we need to reset pieces that were
				// swapped this turn but remain on the board.
				swap_parent = noone;
			}
		}
	
		// There were no valid moves detected on the board.
		else
		{
			// Create the sequence which shows a window
			// telling the user that the board has
			// no valid moves left. This sequence will
			// then create an object that resets the entire board.
			layer_sequence_create("UIElements1", room_width / 2, (room_height / 2) - 200, seq_no_valid_matches)
			
		}
	}
}
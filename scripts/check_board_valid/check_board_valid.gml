// Create a new function which will check if there are any valid moves
// left on the board.
function check_board_valid() 
{
	// Set a global variable called global.valid_moves to 0,
	// this will keep track of whether there are any valid
	// moves on the board.
	global.valid_moves = 0;

	// Apply the following code to all instances of obj_matching_piece
	with(obj_matching_piece) {
		// Begin a for loop which will run through four iterations. This is because
		// we will check what would happen if each piece moved up, down, left or
		// right on the next turn and see if there are any matches.
		for(var _i = 0; _i < 4; _i += 1) {
			// Create a new temporary variable called _x_to_check
			// We set this to the current x position, plus lengthdir_x( 100, _i*90)
			// This will tell each iteration of the for loop to check the squares
			// above, below, left and right of the current piece for matches.
			var _x_to_check = x+lengthdir_x(100,_i*90);
		
			// Create a new temporary variable called _y_to_check
			// We set this to the current y position, plus lengthdir_y( 100, _i*90)
			// This will tell each iteration of the for loop to check the squares
			// above, below, left and right of the current piece for matches.
			var _y_to_check = y+lengthdir_y(100,_i*90);
		
			// Declare a temporary variable called _vertical_matches
			// to keep track of vertical matches.
			var _vertical_matches = 0;
		
			// Declare a temporary variable called _horizontal_matches
			// to keep track of horizontal matches.
			var _horizontal_matches = 0;
		
			// Declare a temporary variable called _square_to_check which will
			// increase as we check each square.
			var _square_to_check = 1;
		
			// Start a loop to check all squares to the left of the current _x_to_check & _y_to_check coordinates
			while(true)
			{
				// If there is not a playfield square in the _x_to_check or _y_to_check
				// position, this piece can't be swapped into it, so don't check it for
				// matches.
				var _square = collision_point(_x_to_check, _y_to_check, obj_playfield_parent, true, 1);
				if(!_square)
				{
					break;	// Break the loop.
				}
			
				// Check squares to the left of the _x_to_check & _y_to_check coordinates
				// for pieces. Notice that the x position to check is multiplied by _square_to_check
				// which increments every time this loop runs successfully.
				// If we find a piece we assign its id to a temporary variable called _piece_to_check.
				var _piece_to_check = collision_point(_x_to_check+(_square_to_check*-100), _y_to_check, obj_matching_piece, true, 1);
				if(_piece_to_check)
				{
					// Check if the image_index of the _piece_to_check
					// is the same as this object's own image_index.
					// _i.e. Check if these two objects are matching pieces!
					if(_piece_to_check.image_index == image_index)
					{
						// The piece we were checking matched the color of this one,
						// so increase our counter for horizontal matches.
						_horizontal_matches += 1;
					
						// Increment the square to check so that when the loop
						// next runs, it is checking for the next matching piece
						_square_to_check += 1;
					}
				
					// We hit a piece that doesn't match the current object, so
					// stop checking in this direction.
					else
					{
						break;	// Break the loop.
					}
				}
			
				// If there wasn't another piece to the left of 
				// the _x_to_check & _y_to_check coordinates.
				else
				{
					break;	// Break the loop.
				}
			}
		
			// Here we're resetting the temporary variable before we loop
			// through adjacent squares checking how many of them in a row
			// match the current square. This will be incremented and reset
			// multiple times while we check for matches.
			_square_to_check = 1;
		
			// Start a loop to check all squares to the right of the current _x_to_check & _y_to_check coordinates.
			while(true)
			{
				// If there is not a playfield square in the _x_to_check or _y_to_check
				// position, this piece can't be swapped into it, so don't check it for
				// matches.
				var _square = collision_point(_x_to_check, _y_to_check, obj_playfield_parent, true, 1);
				if(!_square)
				{
					// Break the loop.
					break;
				}
			
				// Check squares to the right of the _x_to_check & _y_to_check coordinates
				// for pieces. Notice that the x position to check is multiplied by _square_to_check
				// which increments every time this loop runs successfully.
				// If we find a piece we assign its id to a temporary variable called _piece_to_check.
				var _piece_to_check = collision_point(_x_to_check+(_square_to_check*100), _y_to_check, obj_matching_piece, true, 1);
				if(_piece_to_check)
				{
					// Check if the image_index of the _piece_to_check
					// is the same as this object's own image_index.
					// _i.e. Check if these two objects are matching pieces!
					if(_piece_to_check.image_index == image_index)
					{
						// The piece we were checking matched the color of this one,
						// so increase our counter for horizontal matches.
						_horizontal_matches += 1;
					
						// Increment the square to check so that when the loop
						// next runs, it is checking for the next matching piece
						_square_to_check += 1;
					}
				
					// We hit a piece that doesn't match the current _x_to_check & _y_to_check coordinates, so
					// stop checking in this direction.
					else
					{
						// Break the loop.
						break;
					}
				}
			
				// If there wasn't another piece to the right of the _x_to_check & _y_to_check coordinates.
				else
				{
					// Break the loop.
					break;
				}
			}
		
			// Here we're resetting the temporary variable before we loop
			// through adjacent squares checking how many of them in a row
			// match the current square. This will be incremented and reset
			// multiple times while we check for matches.
			_square_to_check = 1;
		
			// Start a loop to check all squares directly above the _x_to_check & _y_to_check coordinates.
			while(true)
			{
				// If there is not a playfield square in the _x_to_check or _y_to_check
				// position, this piece can't be swapped into it, so don't check it for
				// matches.
				var _square = collision_point(_x_to_check, _y_to_check, obj_playfield_parent, true, 1);
				if(!(_square))
				{
					// Break the loop.
					break;
				}
			
				// Check squares directly above the _x_to_check & _y_to_check coordinates
				// for pieces. Notice that the y position to check is multiplied by _square_to_check
				// which increments every time this loop runs successfully.
				// If we find a piece we assign its id to a temporary variable called _piece_to_check.
				var _piece_to_check = collision_point(_x_to_check, _y_to_check+(_square_to_check*-100), obj_matching_piece, true, 1);
				if((_piece_to_check))
				{
					// Check if the image_index of the _piece_to_check
					// is the same as this object's own image_index.
					// _i.e. Check if these two objects are matching pieces!
					if(_piece_to_check.image_index == image_index)
					{
						// The piece we were checking matched the color of this one,
						// so increase our counter for vertical matches.
						_vertical_matches += 1;
					
						// Increment the square to check so that when the loop
						// next runs, it is checking for the next matching piece
						_square_to_check += 1;
					}
				
					// We hit a piece that doesn't match the current _x_to_check & _y_to_check coordinates, so
					// stop checking in this direction.
					else
					{
						// Break the loop.
						break;
					}
				}
			
				// If there wasn't another piece to the left of 
				// the current _x_to_check & _y_to_check coordinates.
				else
				{
					// Break the loop.
					break;
				}
			}
		
			// Here we're resetting the temporary variable before we loop
			// through adjacent squares checking how many of them in a row
			// match the current square. This will be incremented and reset
			// multiple times while we check for matches.
			_square_to_check = 1;
		
			// Start a loop to check all squares directly below the current _x_to_check & _y_to_check coordinates.
			while(true)
			{
				// If there is not a playfield square in the _x_to_check or _y_to_check
				// position, this piece can't be swapped into it, so don't check it for
				// matches.
				var _square = collision_point(_x_to_check, _y_to_check, obj_playfield_parent, true, 1);
				if(!(_square))
				{
					// Break the loop.
					break;
				}
			
				// Check squares directly below the _x_to_check & _y_to_check coordinates
				// for pieces. Notice that the y position to check is multiplied by _square_to_check
				// which increments every time this loop runs successfully.
				// If we find a piece we assign its id to a temporary variable called _piece_to_check.
				var _piece_to_check = collision_point(_x_to_check, _y_to_check+(_square_to_check*100), obj_matching_piece, true, 1);
				if((_piece_to_check))
				{
					// Check if the image_index of the _piece_to_check
					// is the same as this object's own image_index.
					// _i.e. Check if these two objects are matching pieces!
					if(_piece_to_check.image_index == image_index)
					{
						// The piece we were checking matched the color of this one,
						// so increase our counter for vertical matches.
						_vertical_matches += 1;
					
						// Increment the square to check so that when the loop
						// next runs, it is checking for the next matching piece
						_square_to_check += 1;
					}
				
					// We hit a piece that doesn't match the current _x_to_check & _y_to_check coordinates, so
					// stop checking in this direction.
					else
					{
						// Break the loop.
						break;
					}
				}
			
				// If there wasn't another piece to the left of 
				// the current _x_to_check & _y_to_check coordinates.
				else
				{
					// Break the loop.
					break;
				}
			}
		
			// This expression checks whether either a horizontal or vertical match
			// was found. >= means "greater than or equal to" and || means "or".
			// We're using an expression here because it makes more sense than checking
			// each variable individually in separated "if-else" checks.
			if(_horizontal_matches >= 2 || _vertical_matches >= 2)
			{
				// We found at least one match, so set the global variable global.valid_moves relative to 1.
				// This will tell obj_controller to allow the game to continue, rather than resetting the
				// board due to a lack of valid remaining moves.
				global.valid_moves += 1;
			
				// Break the for loop, since we found a match we no longer need to keep checking for valid
				// matches.
				break;
			}
		}
	}
}
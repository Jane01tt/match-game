// Create a new function that will check to ensure no pieces
// on the board create a full match at the beginning of the game.
function check_on_startup() 
{
	// Start a loop which will increment the image_index of this piece
	// as we check for matches.
	while(true)
	{
		// We declare a temporary variable called _vertical_matches
		// to keep track of vertical matches.
		var _vertical_matches = 0;
	
		// We declare a temporary variable called _horiztonal_matches
		// to keep track of horizontal matches.
		var _horizontal_matches = 0;
	
		// Here we're setting up a temporary variable before we loop
		// through adjacent squares checking how many of them in a row
		// match the current square. This will be incremented and reset
		// multiple times while we check for matches.
		var _square_to_check = 1;
	
		// Start a loop to check all squares to the left of the current object.
		while(true)
		{
			// Check squares to the left of the object
			// for pieces. Notice that the x position
			// to check is multiplied by _square_to_check
			// which increments every time this loop
			// runs successfully.
			// If we find a piece we assign its id to
			// a temporary variable called _piece_to_check.
			var _piece_to_check = collision_point(x + _square_to_check*-100, y + 0, obj_matching_piece, true, 1);
			if((_piece_to_check))
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
					// Break the loop and stop checking to
					// the left of this object.
					break;
				}
			}
		
			// If there wasn't another piece to the left of 
			// the current object.
			else
			{
				// Break the loop and stop checking to
				// the left of this object.
				break;
			}
		}
	
		// Here we're resetting the temporary variable before we loop
		// through adjacent squares checking how many of them in a row
		// match the current square. This will be incremented and reset
		// multiple times while we check for matches.
		_square_to_check = 1;
	
		// Start a loop to check all squares to the right of the current object.
		while(true)
		{
			// Check squares to the right of the object
			// for pieces. Notice that the x position
			// to check is multiplied by _square_to_check
			// which increments every time this loop
			// runs successfully.
			// If we find a piece we assign its id to
			// a temporary variable called _piece_to_check.
			var _piece_to_check = collision_point(x + _square_to_check*100, y + 0, obj_matching_piece, true, 1);
			if((_piece_to_check))
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
					// Break the loop and stop checking to
					// the right of this object.
					break;
				}
			}
		
			// If there wasn't another piece to the right of 
			// the current object.
			else
			{
				// Break the loop and stop checking to
				// the right of this object.
				break;
			}
		}
	
		// Here we're resetting the temporary variable before we loop
		// through adjacent squares checking how many of them in a row
		// match the current square. This will be incremented and reset
		// multiple times while we check for matches.
		_square_to_check = 1;
	
		// Start a loop to check all squares directly above the current object.
		while(true)
		{
			// Check squares directly above the object
			// for pieces. Notice that the y position
			// to check is multiplied by _square_to_check
			// which increments every time this loop
			// runs successfully.
			// If we find a piece we assign its id to
			// a temporary variable called _piece_to_check.
			var _piece_to_check = collision_point(x + 0, y + _square_to_check*-100, obj_matching_piece, true, 1);
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
			
				// We hit a piece that doesn't match the current object, so
				// stop checking in this direction.
				else
				{
					// Break the loop and stop checking
					// above this object.
					break;
				}
			}
		
			// If there wasn't another piece to the left of 
			// the current object.
			else
			{
				// Break the loop and stop checking
				// above this object.
				break;
			}
		}
	
		// Here we're resetting the temporary variable before we loop
		// through adjacent squares checking how many of them in a row
		// match the current square. This will be incremented and reset
		// multiple times while we check for matches.
		_square_to_check = 1;
	
		// Start a loop to check all squares directly below the current object.
		while(true)
		{
			// Check squares directly below the object
			// for pieces. Notice that the y position
			// to check is multiplied by _square_to_check
			// which increments every time this loop
			// runs successfully.
			// If we find a piece we assign its id to
			// a temporary variable called _piece_to_check.
			var _piece_to_check = collision_point(x + 0, y + _square_to_check*100, obj_matching_piece, true, 1);
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
			
				// We hit a piece that doesn't match the current object, so
				// stop checking in this direction.
				else
				{
					// Break the loop and stop checking
					// below this object.
					break;
				}
			}
		
			// If there wasn't another piece to the left of 
			// the current object.
			else
			{
				// Break the loop and stop checking
				// below this object.
				break;
			}
		}
	
		// This expression checks whether either a horizontal or vertical match
		// was found. >= means "greater than or equal to" and || means "or".
		// We're using an expression here because it makes more sense than checking
		// each variable individually in separated "if-else" checks.
		if(_horizontal_matches >= 2 || _vertical_matches >= 2)
		{
			// This object would create a match and we don't 
			// want it to...
			// Increment the image_index of this piece by 1,
			// but then keep it between 0 and the total number
			// of images by using "mod 6".
			// The loop will then begin again to check if the
			// object still creates a matching line.
			image_index = (image_index+1) mod 6;
		}
	
		// No match was found
		else
		{
			// Break the loop, this object can keep its
			// current image_index.
			break;
		}
	}
}
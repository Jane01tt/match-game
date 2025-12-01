// Re-populates empty squares with matching pieces
repopulate_square = function()
{
    // If there is not already an instance of obj_matching piece
    // in this square when it is created, we will need to create
    // one.
    var _piece = collision_point(x + 0, y + 0, obj_matching_piece, true, 1);
    if (!_piece)
    {
    	// When the play field squares are created, they
    	// each create a matching piece on their own square
    	// to fill the board at the start of the game.
    	// We create them on the "Pieces" layer as this is
    	// above the play field.
    	instance_create_layer(x + 0, y + 0, "Pieces", obj_matching_piece);
    
    	// If this was the last playfield square to create
    	// a piece, we need to run some checks to see if the
    	// board has any valid moves available at the start
    	// of the game.
    	// We check that the number of obj_matching_piece matches
    	// the number of obj_playfield_parent to see if this is 
    	// the last piece.
    	if(instance_number(obj_matching_piece) == instance_number(obj_playfield_parent))
    	{
    		// Call the function check_board_valid to see
    		// if there are any valid moves on the board.
    		check_board_valid();
    	
    		// If there were not any valid moves on the board,
    		// we will need to force a valid move.
    		if(global.valid_moves <= 0)
    		{
    			// Set a variable to track whether or not we have created a match.
    			// This will be tested by other instances later in this event.
    			created_match = 0;
    		
    			// Apply the following code to all instances of obj_matching_piece
    			with(obj_matching_piece) {
    				// Destroy the instance, this will clear
    				// the current "faulty" board.
    				instance_destroy();
    			}
    		
    			// Apply the following code to all instances of obj_playfield_parent
    			with(obj_playfield_parent) {
    				// If a forced match hasn't already been created
    				// by the calling instance (other), continue this
    				// block of code.
    				// Otherwise do nothing.
    				if(other.created_match <= 0)
    				{
    					// We want to check if the current instance of
    					// obj_playfield_parent is a "middle" square
    					// in a group of 9 squares, and if so we'll use it
    					// to create our forced match.
    					// Check to see if there are instances of obj_playfield_parent all around this piece.
    					var _square_above = collision_point(x + 0, y + -100, obj_playfield_parent, true, 1);
    					var _square_below = collision_point(x + 0, y + 100, obj_playfield_parent, true, 1);
    					var _square_left = collision_point(x + -100, y + 0, obj_playfield_parent, true, 1);
    					var _square_right = collision_point(x + 100, y + 0, obj_playfield_parent, true, 1);
    					if (_square_above && _square_below && _square_left && _square_right)
    					{
    						// Set the variable created_match for the original calling
    						// instance (other) to 1 - this will stop other instances
    						// of obj_playfield_square from creating guaranteed matches.
    						other.created_match = 1;
    								
    						// pick a random number to assign to each of the pieces
    						// from the number of subimages in the sprite
    						// spr_matching_pieces.
    						// Assign this number to the temporary variable 
    						// _match_to_create.
    						var _match_to_create = floor(random_range(0, sprite_get_number(spr_matching_pieces)-1 + 1));
    								
    						// Create a matching piece to the left of this square,
    						// and assign its id to the temporary variable _piece_to_force.
    						var _piece_to_force = instance_create_layer(x + -100, y + 0, "Pieces", obj_matching_piece);
    								
    						// Change the image_index of the piece we just created
    						// to the same value as _match_to_create
    						_piece_to_force.image_index = _match_to_create;
    								
    						// Create a matching piece to the right of this square,
    						// and assign its id to the temporary variable _piece_to_force.
    						_piece_to_force = instance_create_layer(x + 100, y + 0, "Pieces", obj_matching_piece);
    								
    						// Change the image_index of the piece we just created
    						// to the same value as _match_to_create
    						_piece_to_force.image_index = _match_to_create;
    								
    						// Create a matching piece below this square,
    						// and assign its id to the temporary variable _piece_to_force.
    						_piece_to_force = instance_create_layer(x + 0, y + 100, "Pieces", obj_matching_piece);
    								
    						// Change the image_index of the piece we just created
    						// to the same value as _match_to_create
    						_piece_to_force.image_index = _match_to_create;
    					}
    				}
    			}
    		
    			// Apply the following code to all instances of obj_playfield_parent. We do this separately
    			// to the code above because we want to make sure it happens after every instance has 
    			// performed the code block above.
    			with(obj_playfield_parent) {
    				// If there is not already an instance of obj_matching piece
    				// in this square, we will need to create
    				// one.
    				_piece = collision_point(x + 0, y + 0, obj_matching_piece, true, 1);
    				if (!_piece)
    				{
    					// When the play field squares are created, they
    					// each create a matching piece on their own square
    					// to fill the board at the start of the game.
    					// We create them on the "Pieces" layer as this is
    					// above the play field.
    					instance_create_layer(x + 0, y + 0, "Pieces", obj_matching_piece);
    				}
    			}
    		}
    	}
    }
}

// Call function when this object is created.
// We do this because we want other objects to
// be able to call this again during 
// gameplay.
repopulate_square();


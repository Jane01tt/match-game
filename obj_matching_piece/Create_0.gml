// To make smooth animations later on we are setting up a variable called target_x.
// The object will always approach this position in the step event.
target_x = x;

// As above, we also need to set a target_y variable.
// target_x and target_y start at the same values as the
// object's x and y positions in the room.
target_y = y;

// This variable tells the object if it's currently part of
// a matching set. It will be updated and reset each time
// a player makes a move.
currently_matched = 0;

// This variable keeps track of whether or not the object
// fell into an empty space this turn. We keep track of this
// so we can check for matches and the player can build combos
// when falling blocks also make groups of three.
fell_this_turn = 0;

// Created a variable to store the id of a piece which swaps
// with this one. The variable starts with the value "noone"
// which is a keyword in GameMaker that will never match
// a real instance's id.
swap_parent = noone;

// We are using the same sprite for all matching pieces,
// but using different subimages. We set the 
// animation speed to 0 to stop the object from cycling
// through each image.
image_speed = 0;

// Set the available piece types depending on the room.
switch(room)
{
	case rm_level_1:
		image_index = floor(random_range(0, 6));
		break;

	case rm_level_2:
		image_index = floor(random_range(0, 7));
		break;

	case rm_level_3:
		image_index = floor(random_range(0, 8));
		break;
}

// Set the instance alpha to 0, we will gradually increase it
// in the step event.
image_alpha = 0;

// Create a variable called draw_squish.
// We use this to draw the effect of the pieces "squishing" when
// they fall into place.
draw_squish = 1;

// Create a variable called draw_squish_target.
// We use this to draw the effect of the pieces "squishing" when
// they fall into place.
draw_squish_target = 1;

// Create a random number and assign it to a temporary variable
// called _y_offset_randomiser. We will multiply this by -10
// in the next action and assign it to the variable draw_y_offset.
// Adding this random element to the y offset will make the
// pieces appear to fall into place more naturally.
var _y_offset_randomiser = floor(random_range(1, 10 + 1));

// Create a variable called draw_y_offset.
// We use this to offset the y at which the object is drawn when it
// is first created.
draw_y_offset = -10*_y_offset_randomiser;

// See scripts >> check_on_startup
// This function checks to see if this piece would create
// a line of three at the start of the game, and if so it
// changes the type of piece until it will no longer create a match.
// NOTE: This script would permanently freeze the game if
// you were using too few types of matching pieces.
check_on_startup();

check_for_matches = function()
{
	// When triggered we call function
	// which checks for matches.
	// Set the currently_matched variable for this piece to "1" - 
    // this effectively tells this piece that it has matched
    // with itself, and will be used when calculating whether
    // or not this piece was in a matching set at the end of this
    // event.
    currently_matched = 1;
    
    // We're about to check for matches after moving this piece,
    // so we declare a temporary variable called _vertical_matches
    // to keep track.
    var _vertical_matches = 0;
    
    // We're about to check for matches after moving this piece,
    // so we declare a temporary variable called _horiztonal_matches
    // to keep track.
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
    		
    			// Update the currently_matched variable of the other piece
    			// to let it know that it is part of a matching set.
    			_piece_to_check.currently_matched = 1;
    		
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
    		
    			// Update the currently_matched variable of the other piece
    			// to let it know that it is part of a matching set.
    			_piece_to_check.currently_matched = 1;
    		
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
    
    // If there were at least 2 other matching pieces
    // horizontally...
    if(_horizontal_matches >= 2)
    {
    	// Apply this following code to all instances of obj_matching_piece
    	with(obj_matching_piece) {
    		// For all pieces that are already in a matching horizontal
    		// line, execute the next piece of code.
    		if(currently_matched > 0)
    		{
    			// Here we are setting currently_matched to 2 instead of 1,
    			// This is to confirm the piece was definitely part of a matching set,
    			// and should not be reset later in the code (you will see where this
    			// becomes relevant after we also check for matches in the vertical
    			// direction).
    			currently_matched = 2;
    		}
    	}
    }
    
    // If there weren't at least 2 matches horizontally,
    // we'll need to stop telling any other tiles that
    // they are currently matched.
    else
    {
    	// Apply this following code to all instances of obj_matching_piece
    	with(obj_matching_piece) {
    		// Reset currently_matched to 0 because not enough
    		// tiles matched to create a full set of 3 or more.
    		currently_matched = 0;
    	}
    }
    
    // If this object had its value for currently_matched set to 0,
    // we'll need to reset it because we want to check vertically.
    // If it wasn't reset we leave it, since it will now be a "2"
    // which means it will be cleared at the end of the turn.
    if(currently_matched < 1)
    {
    	// Reset the currently_matched variable for this piece to "1" - 
    	// this effectively tells this piece that it has matched
    	// with itself, and will be used when calculating whether
    	// or not this piece was in a matching set at the end of this
    	// event.
    	currently_matched = 1;
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
    		
    			// Here we check if the _piece_to_check is not already
    			// set to be currently_matched. If it's set to "2" it means
    			// it was already matched horizontally and must be destroyed
    			// at the end of this turn, so we don't want to downgrade it.
    			// However, if it's set to 0 we set it to 1 here to let the object
    			// know that it matched.
    			if(_piece_to_check.currently_matched < 1)
    			{
    				// Update the currently_matched variable of the other piece
    				// to let it know that it is part of a matching set.
    				_piece_to_check.currently_matched = 1;
    			}
    		
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
    		
    			// Here we check if the _piece_to_check is not already
    			// set to be currently_matched. If it's set to "2" it means
    			// it was already matched horizontally and must be destroyed
    			// at the end of this turn, so we don't want to downgrade it.
    			// However, if it's set to 0 we set it to 1 here to let the object
    			// know that it matched.
    			if(_piece_to_check.currently_matched < 1)
    			{
    				// Update the currently_matched variable of the other piece
    				// to let it know that it is part of a matching set.
    				_piece_to_check.currently_matched = 1;
    			}
    		
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
    
    // If there were at least 2 other matching pieces
    // vertically...
    if(_vertical_matches >= 2)
    {
    	// Apply this following code to all instances of obj_matching_piece
    	with(obj_matching_piece) {
    		// For all pieces that are already in a matching horizontal
    		// line, execute the next piece of code.
    		if(currently_matched > 0)
    		{
    			// Here we are setting currently_matched to 2 instead of 1,
    			// This is to confirm the piece was definitely part of a matching set,
    			// and should not be reset later in the code (you will see where this
    			// becomes relevant later).
    			currently_matched = 2;
    		}
    	}
    }
    
    // If there weren't at least 2 matches vertically,
    // we'll need to stop telling any other tiles that
    // they are currently matched.
    else
    {
    	// Apply this following code to all instances of obj_matching_piece
    	with(obj_matching_piece) {
    		// This is where setting "currently_matched" to 2 earlier in the
    		// event becomes important.
    		// If the piece is NOT part of a matching set, we are about
    		// to reset this value to 0 in the next action.
    		if(currently_matched < 2)
    		{
    			// Reset currently_matched to 0 because not enough
    			// tiles matched to create a full set of 3 or more.
    			currently_matched = 0;
    		}
    	}
    }
    
    // This expression checks whether either a horizontal or vertical match
    // was found. >= means "greater than or equal to" and || means "or".
    // We're using an expression here because it makes more sense than checking
    // each variable individually in separated "if-else" checks.
    if(_horizontal_matches >= 2 || _vertical_matches >= 2)
    {
    	// We found a match, so increase the global variable score_combo
    	// to reflect this.
    	global.score_combo += 1;
    
    	// Set the global variable global.matched_this_turn to 1 to let
    	// all other objects know that we are processing a match.
    	global.matched_this_turn = 1;
    
    	// Make sure global.can_swap is set to 0, since we need to process
    	// the animation for finding a match.
    	global.can_swap = 0;
    
    	// If this object's fell_this_turn variable is set to 0,
    	// _i.e. it moved this turn because the player swapped it,
    	// perform the next action.
    	if(fell_this_turn == 0)
    	{
    		// Call the function text_pop_up()
    		// which creates and instance of the object
    		// obj_text_popup and gives it some text
    		// to show on the screen: In this case
    		// the number of matches the player has 
    		// made in a row.
    		text_pop_up(x+50, y+50, string(global.score_combo)+"x Match");
    	
    		// Play a sound effect to indicate a match has taken place.
    		audio_play_sound(snd_match_small, 0, 0);
    	}
    
    	// fell_this_turn was 1, so execute the next action
    	else
    	{
    		// Call the function text_pop_up()
    		// which creates and instance of the object
    		// obj_text_popup and gives it some text
    		// to show on the screen: In this case
    		// the number of chains that were automatically
    		// made in a row.
    		text_pop_up(x+50, y+50, string(global.score_combo)+"x Chain");
    	
    		// Play a sound effect to indicate a chained match has taken place.
    		audio_play_sound(snd_match_big, 0, 0);
    	}
    
    	// The following code applies to obj_controller
    	with(obj_controller) {
    		// When obj_controller triggered this event to check for combos,
    		// we need to tell it not to reset the current turn because
    		// there is another match to process.
    		reset_turn = 0;
    	
    		// Here we set an alarm to tell the controller object that some pieces
    		// were destroyed. This will trigger Alarm 0 in obj_controller in 15
    		// frames time.
    		// This value will need to change from 15 if the animation for clearing
    		// pieces takes longer than 15 frames.
    		alarm_set(0, 15);
    	}
    
    	// Apply this following code to all instances of obj_matching_piece
    	with(obj_matching_piece) {
    		// If any piece in the current row or column was part of a matching set,
    		// we have already set its currently_matched variable to 2 earlier in 
    		// this event.
    		// Therefore we can now clear those pieces from the board.
    		if(currently_matched >= 2)
    		{
    			// For each matching piece, increase the player's score
    			// by 50 points multiplied by the current value of
    			// the global variable score_combo.
    			global.score_total += global.score_combo*50;
    		
    			objective_solve(image_index);
    		
    			// Clear the matched pieces from the board.
    			instance_destroy();
    		}
    	}
    }
    
    // There were no matches for this piece.
    else
    {
    	// If this event is running because the piece fell this turn,
    	// run the following block of code.
    	if(fell_this_turn == 1)
    	{
    		// The piece didn't match anything, so set fell_this_turn 
    		// back to 0 and do nothing else.
    		fell_this_turn = 0;
    	}
    
    	// If fell_this_turn was 0, this event was triggered by the player
    	// moving a piece. Run the following block of code.
    	else
    	{
    		// Apply the following code to obj_controller
    		with(obj_controller) {
    			// Set alarm[2] to just 2 frames. This gives other pieces time
    			// to process. alarm[2] of obj_controller checks whether or not
    			// this was a valid move and if not, it will swap the pieces
    			// back. If it was a valid move alarm[2] will do nothing and
    			// the match will be processed as normal.
    			alarm_set(2, 2);
    		}
    	}
    }
}

check_drag = function(_drag_horizontal, _drag_vertical)
{
	// Check if player is in any kind of menu and ends event if it is
	if((instance_exists(obj_game_pause)) || (instance_exists(obj_game_over_lose)) || (instance_exists(obj_game_over_win)) || (instance_exists(obj_no_valid_matches)))
	exit;

	// Check if the player is allowed to swap the pieces.
	// They are not allowed while the game is calculating
	// the result of their previous move, for example.
	if(global.can_swap == 1)
	{
		// The player dragged this matching piece one square to the right
		if(_drag_horizontal > sprite_width / 2)
		{
			// Check if there is a piece on the playfield
			// one square to the right of the piece currently
			// being dragged.
			// If yes, assign the id of the piece we want to
			// swap with to a temporary variable called
			// _piece_to_swap.
			var _piece_to_swap = collision_point(x + sprite_width, y, obj_matching_piece, true, 1);
			if((_piece_to_swap))
			{
				// Play a sound effect indicating that the
				// pieces are being swapped.
				audio_play_sound(snd_piece_swap, 0, 0);
		
				// Set the current piece to move to the right
				// by updating the target_x variable which
				// the piece will approach in the step event
				target_x += sprite_width;
		
				// Tell the piece we're swapping with to move
				// to the left by updating the target_x variable which
				// the piece will approach in its step event
				_piece_to_swap.target_x -= _piece_to_swap.sprite_width;
		
				// Tell the piece we're swapping with which piece
				// forced it to swap by changing its swap_parent
				// variable to the id of this instance
				_piece_to_swap.swap_parent = id;
		
				// For this piece, set the variable swap_parent to the id
				// of the _piece_to_swap so that we can use it later
				swap_parent = _piece_to_swap;
		
				// The player performed a valid move and the game will
				// now need to calculate the result of that move before
				// we let the player move again.
				// Here we set the global variable can_swap to 0.
				global.can_swap = 0;
		
				// Wait 15 steps for the current move to animate before
				// checking for matches. If you change the speed at which
				// the pieces move in the step event, you will also need
				// to change this value.
				var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
				time_source_start(_ts_check_for_matches);
		
				// Apply the following code to the _piece_to_swap
				with(_piece_to_swap) 
				{
					// Wait 15 steps for the current move to animate before
					// checking for matches. If you change the speed at which
					// the pieces move in the step event, you will also need
					// to change this value.
					_ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
					time_source_start(_ts_check_for_matches);
				}
		
				// Since we have already started processing a valid move, exit the
				// current event so that no more drags are processed.
				exit;
			}
		}

		// The player dragged this matching piece one square to the left
		if(_drag_horizontal < -sprite_width / 2)
		{
			// Check if there is a piece on the playfield
			// one square to the left of the piece currently
			// being dragged.
			// If yes, assign the id of the piece we want to
			// swap with to a temporary variable called
			// _piece_to_swap.
			var _piece_to_swap = collision_point(x - sprite_width, y, obj_matching_piece, true, 1);
			if((_piece_to_swap))
			{
				// Play a sound effect indicating that the
				// pieces are being swapped.
				audio_play_sound(snd_piece_swap, 0, 0);
		
				// Set the current piece to move to the left
				// by updating the target_x variable which
				// the piece will approach in the step event
				target_x -= sprite_width;
		
				// Tell the piece we're swapping with to move
				// to the right by updating the target_x variable which
				// the piece will approach in its step event
				_piece_to_swap.target_x += _piece_to_swap.sprite_width;
		
				// Tell the piece we're swapping with which piece
				// forced it to swap by changing its swap_parent
				// variable to the id of this instance
				_piece_to_swap.swap_parent = id;
		
				// For this piece, set the variable swap_parent to the id
				// of the _piece_to_swap so that we can use it later
				swap_parent = _piece_to_swap;
		
				// The player performed a valid move and the game will
				// now need to calculate the result of that move before
				// we let the player move again.
				// Here we set the global variable can_swap to 0.
				global.can_swap = 0;
		
				// Wait 15 steps for the current move to animate before
				// checking for matches. If you change the speed at which
				// the pieces move in the step event, you will also need
				// to change this value.
				var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
				time_source_start(_ts_check_for_matches);
		
				// Apply the following code to the _piece_to_swap
				with(_piece_to_swap) 
				{
					// Wait 15 steps for the current move to animate before
					// checking for matches. If you change the speed at which
					// the pieces move in the step event, you will also need
					// to change this value.
					_ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
					time_source_start(_ts_check_for_matches);
				}
		
				// Since we have already started processing a valid move, exit the
				// current event so that no more drags are processed.
				exit;
			}
		}

		// The player dragged this matching piece one square downwards
		if(_drag_vertical > sprite_height / 2)
		{
			// Check if there is a piece on the playfield
			// one square below the piece currently
			// being dragged.
			// If yes, assign the id of the piece we want to
			// swap with to a temporary variable called
			// _piece_to_swap.
			var _piece_to_swap = collision_point(x, y + sprite_height, obj_matching_piece, true, 1);
			if((_piece_to_swap))
			{
				// Play a sound effect indicating that the
				// pieces are being swapped.
				audio_play_sound(snd_piece_swap, 0, 0);
		
				// Set the current piece to move downwards
				// by updating the target_y variable which
				// the piece will approach in the step event
				target_y += sprite_height;
		
				// Tell the piece we're swapping with to move
				// upwards by updating the target_y variable which
				// the piece will approach in its step event
				_piece_to_swap.target_y -= _piece_to_swap.sprite_height;
		
				// Tell the piece we're swapping with which piece
				// forced it to swap by changing its swap_parent
				// variable to the id of this instance
				_piece_to_swap.swap_parent = id;
		
				// For this piece, set the variable swap_parent to the id
				// of the _piece_to_swap so that we can use it later
				swap_parent = _piece_to_swap;
		
				// The player performed a valid move and the game will
				// now need to calculate the result of that move before
				// we let the player move again.
				// Here we set the global variable can_swap to 0.
				global.can_swap = 0;
		
				// Wait 15 steps for the current move to animate before
				// checking for matches. If you change the speed at which
				// the pieces move in the step event, you will also need
				// to change this value.
				var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
				time_source_start(_ts_check_for_matches);
		
				// Apply the following code to the _piece_to_swap
				with(_piece_to_swap) 
				{
					// Wait 15 steps for the current move to animate before
					// checking for matches. If you change the speed at which
					// the pieces move in the step event, you will also need
					// to change this value.
					_ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
					time_source_start(_ts_check_for_matches);
				}
		
				// Since we have already started processing a valid move, exit the
				// current event so that no more drags are processed.
				exit;
			}
		}

		// The player dragged this matching piece one square upwards
		if(_drag_vertical < -sprite_height / 2)
		{
			// Check if there is a piece on the playfield
			// one square above the piece currently
			// being dragged.
			// If yes, assign the id of the piece we want to
			// swap with to a temporary variable called
			// _piece_to_swap.
			var _piece_to_swap = collision_point(x, y - sprite_height, obj_matching_piece, true, 1);
			if((_piece_to_swap))
			{
				// Play a sound effect indicating that the
				// pieces are being swapped.
				audio_play_sound(snd_piece_swap, 0, 0);
		
				// Set the current piece to move upwards
				// by updating the target_y variable which
				// the piece will approach in the step event
				target_y -= sprite_height;
		
				// Tell the piece we're swapping with to move
				// downwards by updating the target_y variable which
				// the piece will approach in its step event
				_piece_to_swap.target_y += _piece_to_swap.sprite_height;
		
				// Tell the piece we're swapping with which piece
				// forced it to swap by changing its swap_parent
				// variable to the id of this instance
				_piece_to_swap.swap_parent = id;
		
				// For this piece, set the variable swap_parent to the id
				// of the _piece_to_swap so that we can use it later
				swap_parent = _piece_to_swap;
		
				// The player performed a valid move and the game will
				// now need to calculate the result of that move before
				// we let the player move again.
				// Here we set the global variable can_swap to 0.
				global.can_swap = 0;
		
				// Wait 15 steps for the current move to animate before
				// checking for matches. If you change the speed at which
				// the pieces move in the step event, you will also need
				// to change this value.
				var _ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
				time_source_start(_ts_check_for_matches);
		
				// Apply the following code to the _piece_to_swap
				with(_piece_to_swap) 
				{
					// Wait 15 steps for the current move to animate before
					// checking for matches. If you change the speed at which
					// the pieces move in the step event, you will also need
					// to change this value.
					_ts_check_for_matches = time_source_create(time_source_game, 15, time_source_units_frames, check_for_matches);
					time_source_start(_ts_check_for_matches);
				}
		
				// Since we have already started processing a valid move, exit the
				// current event so that no more drags are processed.
				exit;
			}
		}
	}
}
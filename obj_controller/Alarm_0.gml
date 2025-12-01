// If obj_game_over_win exists...
var _game_over = instance_exists(obj_game_over_win);
if(_game_over)
{
	// Then exit this event, preventing the creation of new peices.
	exit;
}

// This event is triggered from User Event 0 of obj_matching piece. It tells the controller
// to reset the board after pieces have been matched.
// The following code is applied back to all instances of obj_matching_piece, so
// they can detect whether or not they should fall into empty spaces lower on the
// board.
with(obj_matching_piece) {
	// Set up a temporary variable to keep
	// track of which squares we will check
	// when resetting the board. This will be
	// incremented in the loop below.
	var _square_to_check = 1;

	// Set up a temporary variable to keep
	// track of the largest height from which
	// any piece will fall. We pass this information
	// into an alarm later to allow time for the
	// falling animation to happen.
	var _fall_time = 0;

	// Start a loop to check for empty spaces
	// below each piece on the board.
	while(true)
	{
		// If there is a play field square below the current piece...
		var _square = collision_point(x + 0, y + _square_to_check*100, obj_playfield_parent, true, 1);
		if(_square)
		{
			// If there is NOT an instance of obj_matching_piece
			// in the play field square being checked it must be
			// empty, so this piece can fall into it.
			var _piece = collision_point(x + 0, y + _square_to_check*100, obj_matching_piece, true, 1);
			if(!_piece)
			{
				// Increment target_y by 100, this will make
				// this piece fall one square below its current
				// position since y gradually approaches target_y
				// in the step event
				target_y += 100;
			
				// Update the fell_this_turn variable so that
				// the piece knows to check for matches once all
				// other pieces have fallen into place
				fell_this_turn = 1;
			
				// Increment the _fall_time variable. You will need
				// to change this value if you have changed how fast
				// pieces fall in the step event of obj_matching_piece.
				_fall_time += 10;
			
				// Increment the _square_to_check variable so that
				// the loop will continue to check the next empty square
				_square_to_check += 1;
			}
		
			// The play field square below this piece was not empty.
			else
			{
				// Increment the _square_to_check variable so that
				// the loop will continue to check the next empty square.
				_square_to_check += 1;
			}
		}
	
		// There was not another play field square below this piece.
		else
		{
			// Break the current loop.
			break;
		}
	}

	// If alarm[1] in obj_controller is lower than the
	// current time it will take to animated falling objects...
	if(obj_controller.alarm[1] < _fall_time+5)
	{
		// Set alarm[1] in obj_controller to match the time it 
		// will take to animate falling objects.
		obj_controller.alarm[1] = _fall_time+5;
	}
}

// The following code is applied to play field squares, to check whether
// there will be empty spaces in each column on any given turn so that
// they can be filled with new blocks.
with(obj_playfield_parent) {
	// If there is not another instance of obj_playfield_parent
	// above this one, then it must be the "top" square in each
	// column, so it should be the one to check the whole column
	// for empty squares.
	var _top_square = collision_point(x + 0, y + -100, obj_playfield_parent, true, 1);
	if(!_top_square)
	{
		// Create a temporary variable called _square_to_check which
		// we will increment to check all squares in the column.
		var _square_to_check = 0;
	
		// Declare a temporary variable to keep track of how
		// many empty squares there are in this column
		var _empty_squares = 0;
	
		// Begin a loop to check for empty squares.
		while(true)
		{
			// Check if there is a play field square where
			// we are currently looking.
			// Note we are multiplying 100 (the size of the squares)
			// by _square_to_check.
			// We start at 0 and do not select "Exclude Self"
			// for this check since we want to check if the
			// top square itself is empty.
			var _square = collision_point(x + 0, y + _square_to_check*100, obj_playfield_parent, true, 0);
			if((_square))
			{
				// Check if the playfield square is empty,
				// and if it is we increment the _empty_squares
				// variable.
				var _piece = collision_point(x + 0, y + _square_to_check*100, obj_matching_piece, true, 1);
				if(!_piece)
				{
					// Increment the number of empty squares we found.
					_empty_squares += 1;
				}
			
				// Increment the square to check and continue the loop.
				_square_to_check += 1;
			}
		
			// There was not a play field square, so we can stop checking as we have
			// reached the bottom of this column
			else
			{
				break;	// Break the loop
			}
		}
	
		// After the loop finishes, we check if there
		// were any empty squares in this column. If
		// there were, we execute the following piece of code.
		if(_empty_squares > 0)
		{
			// Here we set up a new loop called a "for loop". This will allow
			// us to easily create one piece for each empty square in this column
			// and tell it to fall into the right place.
			// _i = 1 sets a value we can increment as we create each piece.
			// _i <= _empty_squares means the loop will stop automatically when _i reaches 
			// the number of empty squares in the column
			// _i += 1 will increment _i every time this loop runs
			for(var _i = 1; _i <= _empty_squares; _i += 1) {
				
				// Create a new instance of obj_matching_piece above this column.
				// Notice we multiply _i, the current iteration of this loop, by -100, the size of the grid squares.
				// We assign the id of the new piece to the temporary variable _new_piece.
				var _new_piece = instance_create_layer(x + 0, y + _i*-100, "Pieces", obj_matching_piece);
			
				// Here we set the target_y of the new piece to make it fall into the right square.
				// The formula looks complicated, but it makes sure that the piece
				// that spawns closest to the top of the current column falls
				// the farthest and settles at the lowest empty square of the column.
				_new_piece.target_y = y+(100*_empty_squares)-(_i*100);
			
				// Update the fell_this_turn variable so that
				// the new piece knows to check for matches once all
				// other pieces have fallen into place
				_new_piece.fell_this_turn = 1;
			}
		
			// When pieces need to fall into place on the board, we will
			// need to stall the player from taking more turns until the
			// board has fully reset.
			// We check if alarm[1] for obj_controller is set too low,
			// and if so we will set the alarm to a higher value.
			// NOTE: If you change the speed at which pieces fall in the step
			// event of obj_matching_piece, you would need to change the value here too.
			if(obj_controller.alarm[1] < (_empty_squares*10)+5)
			{
				// NOTE: If you change the speed at which pieces fall in the step
				// event of obj_matching_piece, you would need to change the value here too.
				obj_controller.alarm[1] = (_empty_squares*10)+5;
			}
		}
	}
}
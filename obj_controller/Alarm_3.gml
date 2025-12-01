// Apply the following code to obj_playfield_parent
with(obj_playfield_parent) 
{
	// Re-populates empty squares with matching pieces
	repopulate_square();
}

// Set alarm 1 of this object, obj_controller, to 15 frames.
// When the alarm is triggered the player will be free to take
// their next turn.
alarm_set(1, 15);
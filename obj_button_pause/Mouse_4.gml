if(!(instance_exists(obj_game_pause)) && !(instance_exists(obj_game_over_lose)) && !(instance_exists(obj_game_over_win)) && !(instance_exists(obj_no_valid_matches)))
{
	// When the left mouse button is clicked on top of
	// this object, set the image_index to 1 to show that
	// the button is being clicked.
	sprite_index = sprite_index;
	image_index = 1;
}
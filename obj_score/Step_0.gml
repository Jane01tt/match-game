// If view width is over view height then we are in landscape...
if(camera_get_view_width(view_camera[0]) > camera_get_view_height(view_camera[0]))
{
	// This object is visible.
	visible = true;
}

// Else we are in portrait...
else
{
	// This object is invisible.
	visible = false;

	// Exit the event because we don't want to execute the folowing actions in portrait.
	exit;
}

// If the player has reached the first star on the score bar
// (by getting one fifth of the score target)...
if(global.score_total > 0)
{
	// If we haven't yet created the instance which animates this 
	// star on the HUD...
	if(star_done[0] < 1)
	{
		// Create an instance of the object obj_effect_star
		// at the correct place on the HUD and assign its 
		// id to the temporary variable _this_star.
		var _this_star = instance_create_layer(x + 100, y + 660, "UIElements2", obj_effect_star);
	
		// Tell the newly created star that it is star number "0"
		// by assigning its my_star_number variable a value of 0.
		_this_star.my_star_number = 0;
	
		// Set star_done[0] to 1 so that we don't create more
		// than 1 star effect object.
		star_done[0] = 1;
	}
}

// If the player has reached the second star on the score bar
// (by getting half of the score target)...
if(global.score_total >= global.score_target * 0.4)
{
	// If we haven't yet created the instance which animates this 
	// star on the HUD...
	if(star_done[1] < 1)
	{
		// Create an instance of the object obj_effect_star
		// at the correct place on the HUD and assign its 
		// id to the temporary variable _this_star.
		var _this_star = instance_create_layer(x + 100, y +  460, "UIElements2", obj_effect_star);
	
		// Tell the newly created star that it is star number "1"
		// by assigning its my_star_number variable a value of 1.
		_this_star.my_star_number = 1;
	
		// Set star_done[1] to 1 so that we don't create more
		// than 1 star effect object.
		star_done[1] = 1;
	}
}

// If the player has reached the third star on the score bar
// (by getting the score target)...
if(global.score_total >= global.score_target)
{
	// If we haven't yet created the instance which animates this 
	// star on the HUD...
	if(star_done[2] < 1)
	{
		// Create an instance of the object obj_effect_star
		// at the correct place on the HUD and assign its 
		// id to the temporary variable _this_star.
		var _this_star = instance_create_layer(x + 100, y + 160, "UIElements2", obj_effect_star);
	
		// Tell the newly created star that it is star number "2"
		// by assigning its my_star_number variable a value of 2.
		_this_star.my_star_number = 2;
	
		// Set star_done[2] to 1 so that we don't create more
		// than 1 star effect object.
		star_done[2] = 1;
	}
}
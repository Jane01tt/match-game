// If the image_index is equal to 1, which means that
// the left mouse button was clicked on this button
// already...
if(image_index == 1)
{
	// Play a sound effect for when the button
	// is clicked.
	audio_play_sound(snd_ui_click, 0, 0);

	// If this is not the last room (level)...
	if(room != room_last)
	{
		// Go to the next room (level).
		room_goto_next();
	}

	// This was indeed the last room...
	else
	{
		// So go back to the main menu.
		room_goto(rm_menu);
	}
}
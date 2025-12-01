// If the image_index is equal to 1, which means that
// the left mouse button was clicked on this button
// already...
if(image_index == 1)
{
	// Play a sound effect for when the button
	// is clicked.
	audio_play_sound(snd_ui_close, 0, 0);

	// The player pressed "Quit" so we go back
	// to the main menu.
	room_goto(rm_menu);
}
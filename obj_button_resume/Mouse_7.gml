// If the image_index is equal to 1, which means that
// the left mouse button was clicked on this button
// already...
if(image_index == 1)
{
	// Play a sound effect for when the button
	// is clicked.
	audio_play_sound(snd_ui_click, 0, 0);

	audio_play_sound(snd_music_game, 0, 0);

	instance_destroy();

	with(obj_game_pause) instance_destroy();

	with(obj_game_over_button_quit) instance_destroy();

	with(obj_banner_pause) instance_destroy();
}
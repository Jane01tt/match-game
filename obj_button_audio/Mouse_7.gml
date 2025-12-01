// If the image_index is equal to 1, which means that
// the left mouse button was clicked on this button
// already...
if(image_index == 1)
{
	// Play a sound effect for when the button
	// is clicked.
	audio_play_sound(snd_ui_click, 0, 0);

	// If the global variable global.audio_volume is 0
	// _i.e. If the audio is currently muted
	if(global.audio_volume == 0)
	{
		// Set global.audio_volume to 1 to unmute
		// the audio.
		global.audio_volume = 1;
	}

	// Else means the audio is not currently muted.
	else
	{
		// Set global.audio_volume to 0 to mute
		// the audio.
		global.audio_volume = 0;
	}

	if (global.audio_volume > 0) 
	{
		// Set the master volume to global.audio_volume so
		// that pressing this button actually changes the
		// audio volume.
		audio_set_master_gain(0, global.audio_volume);

		// Play a sound effect for when the button
		// is clicked.
		audio_play_sound(snd_ui_click, 0, 0);	
	} 
	else 
	{
		var _set_gain = function()
		{
			// Set the master volume to global.audio_volume so
			// that pressing this button actually changes the
			// audio volume.
			audio_set_master_gain(0, global.audio_volume);

			// Play a sound effect for when the button
			// is clicked.
			audio_play_sound(snd_ui_click, 0, 0);	
		}
		
		var _ts_set_gain = time_source_create(time_source_game, 20, time_source_units_frames, _set_gain);
		time_source_start(_ts_set_gain);
	}
	
	// Changes the sprite for the button to unpressed again
	image_index = 0;
}
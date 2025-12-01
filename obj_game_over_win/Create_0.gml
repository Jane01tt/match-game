// Apply the following code to all instances of obj_matching_piece...
with(obj_matching_piece) {
	// Create obj_effect_game_won at this object's position.
	// This will create the effect of pieces falling from
	// the bottom of the board when the game is won.
	// We assign the id of this new object to the 
	// variable _effect_piece so we can target it in the
	// next action.
	var _effect_piece = instance_create_layer(x + 0, y + 0, "Pieces", obj_effect_game_won);

	// Change the image_index of the effect piece to 
	// match the image_index of the current piece
	_effect_piece.image_index = image_index;

	// Destroy the instance of obj_matching_piece
	instance_destroy();
}

// Stop the game music from playing.
audio_stop_sound(snd_music_game);

// If the game win music is still playing 
if (audio_is_playing(snd_game_win))
{
	// Stop the game win music from playing.
	audio_stop_sound(snd_game_win);
}

// Play a music effect for winning the game.
audio_play_sound(snd_game_win, 0, 0);
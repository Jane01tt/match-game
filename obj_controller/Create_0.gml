// Set a global variable which can be checked by
// all objects. This will tell objects whether
// or not the player is currently allowed to 
// swap matching pieces, or whether we are
// waiting for the game to finish calculating 
// the result of the player's previous turn.
global.can_swap = 1;

drag_start_x = 0;
drag_start_y = 0;

reset_turn = 0;

// Set how many moves the player is allowed to use
// before they will fail this level.
// For this example we're using 20 moves.
global.moves_available = 25;

// Set the target for the score the player must reach to win the level.
switch(room)
{
	case rm_level_1:
		global.score_target = 10000;
		break;

	case rm_level_2:
		global.score_target = 15000;
		break;

	case rm_level_3:
		global.score_target = 20000;
		break;
}

// Set the current score for the round to 0 in a global
// variable called score_total.
global.score_total = 0;

// Set the current score combo to 0, this will increase
// every time a match is made in succession increasing
// the points the player can win from each match.
global.score_combo = 0;

// Set a variable to tell all objects if a match
// was made on the player's turn
global.matched_this_turn = 0;

// Set a variable to keep track of the width of the score
// bar since we want it to increase in size with a nice 
// gradual animation (see the draw event of this object).
score_bar_width = 0;

// If the menu music is still playing when the level starts...
if (audio_is_playing(snd_music_menu))
{
	// Stop the menu music from playing.
	audio_stop_sound(snd_music_menu);
}

// If the game win music is still playing when the level starts...
if (audio_is_playing(snd_game_win))
{
	// Stop the game win music from playing.
	audio_stop_sound(snd_game_win);
}

// If the game lose music is still playing when the level starts...
if (audio_is_playing(snd_game_lose))
{
	// Stop the game lose music from playing
	audio_stop_sound(snd_game_lose);
}

// If the game background music is not playing...
if (!audio_is_playing(snd_music_game))
{
	// Play the background music for the game.
	audio_play_sound(snd_music_game, 0, 1);
}
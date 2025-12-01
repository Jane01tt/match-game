// Set the variable my_text to a blank string "".
// This variable is altered by objects which 
// create this one.
my_text = "";

var _destroy_popup = function()
{
	// Destroy the instance.
	instance_destroy();
}

var _ts_destroy_popup = time_source_create(time_source_game, 60, time_source_units_frames, _destroy_popup);

time_source_start(_ts_destroy_popup);
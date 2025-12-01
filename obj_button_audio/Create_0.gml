// Set the animation speed to 0 because the
// sprite has two frames for "pressed" and "not pressed"
// which we will manipulate when the player clicks.
image_speed = 0;

// Sets audio volume to either 0 or 1 so it can be used for the sprite image
if (global.audio_volume > 0)
{
	global.audio_volume = 1;
}
else
{
	global.audio_volume = 0;	
}
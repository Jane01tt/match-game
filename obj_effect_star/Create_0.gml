// Set the animation speed to 0 so that this sprite doesn't animate.
image_speed = 0;

// Set the frame of this sprite to 1 so it always shows the yellow star.
sprite_index = spr_hud_star;
image_index = 1;

// Create a new variable called animation_phase and set it to 0.
// We change this in the step event to make the star animation
// happen on the HUD.
animation_phase = 0;

// Set the instance alpha to 0 so that it will be invisible.
image_alpha = 0;

// Set the number of this star to 0 - this will be manipulated by obj_controller.
my_star_number = 0;

// Play a sound effect when the star pops up.
audio_play_sound(snd_star_award_in_game, 0, 0);
// Set the animation speed to 0 so that this sprite doesn't animate.
image_speed = 0;

// Set the frame of this sprite to 1 so it always shows the yellow star.
sprite_index = spr_hud_star;
image_index = 1;

// Set the image_xscale to a random number between 0.1 and 0.4
// to make the image smaller, but varied in size.
image_xscale = (random_range(0.1, 0.4));

// Set image_yscale to the same value as image_xscale so the image
// stays at a 1:1 ratio.
image_yscale = image_xscale;

// Set the direction to a random angle between 0 and 360.
direction = floor(random_range(0, 359 + 1));

// Set the speed to a random number between 4 and 5.
speed = (random_range(4, 5));

// Set the friction to 0.1, this will slow down the instance
// every step until its speed reaches 0.
friction = 0.1;
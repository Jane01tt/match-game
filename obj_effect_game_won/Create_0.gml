// Set the animation speed to zero so this object doesn't
// cycle through all the frames of its sprite. It is
// set to have the correct image_index in the "destroy"
// event of obj_matching_piece
image_speed = 0;

// Set the gravity direction to 270, which will make
// the object fall downwards when the gravity force
// is applied.
gravity_direction = 270;

// Set the gravity force to 1 so the object will start
// to fall.
gravity = 1;

// Set the hspeed (horizontal speed) to a random number
// between -8 and 8 so the object will fall a little
// bit sideways.
hspeed = random_range(-8, 8);
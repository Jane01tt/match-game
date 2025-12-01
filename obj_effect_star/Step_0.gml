// If the animation_phase variable is 0...
if(animation_phase == 0)
{
	// Make the instance grow in size slightly every frame.
	image_xscale += 0.025;
	image_yscale += 0.025;

	// Make the instance alpha increase every frame.
	image_alpha += 0.05;

	// If the image_alpha has reached 1 and therefore the object is fully visible...
	if(image_alpha >= 1)
	{
		// Create an expanding ring effect on this object.
		effect_create_above(1, x + 0, y + 0, 2, $FF00FFFF & $ffffff);
	
		// Repeat the following block of code 12 times (to create 12 particle instances).
		repeat(12)
		{
			// Create instances of the object obj_effect_star_particle
			// at this instance's x and y position.
			instance_create_layer(x + 0, y + 0, "UIElements2", obj_effect_star_particle);
		}
	
		// Set the animation_phase variable to 1.
		animation_phase = 1;
	}
}

// If the animation_phase variable is not 0...
else
{
	// Make the image_xscale approach 1 again using the lerp()
	// function to create a smooth animation.
	image_xscale = lerp(image_xscale,1,0.25);

	// Set the image_yscale to the same as the image_xscale.
	image_yscale = image_xscale;

	// When the image_xscale has nearly hit 1...
	// We're checking it "nearly" hits because using lerp
	// means the image_xscale variable will be left with a small
	// number after the decimal point.
	if(image_xscale < 1.05)
	{
		// Set star_done[n] for obj_controller to 2, where n
		// is the same as the my_star_number variable for this instance.
		// This tells the controller to draw the star filled in on the HUD.
		obj_controller.star_done[my_star_number] = 2;
	
		// Destroy this instance.
		instance_destroy();
	}
}
// Gradually increase in size
image_xscale += 0.1;
image_yscale += 0.1;

// Gradually decrease in opacity
image_alpha += -0.1;

// If the object's image_alpha value, being decreased above,
// has reached 0...
if(image_alpha <= 0)
{
	// Destroy the object
	instance_destroy();
}
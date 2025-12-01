// If the speed of this object has reached zero...
if(speed <= 0)
{
	// Set the instance alpha to reduce by 0.05 every frame
	// so that the object will fade out.
	image_alpha += -0.05;

	// If the image_alpha has reached 0...
	if(image_alpha <= 0)
	{
		// Destroy this instance.
		instance_destroy();
	}
}
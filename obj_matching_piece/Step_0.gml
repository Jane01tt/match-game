// Check if the piece's x position is less than its target_x position,
// for smooth animations when the player swaps pieces.
if(x < target_x)
{
	// Move towards the target_x position by 12 pixels.
	x += 10;
	y += 0;
}

// Check if the piece's x position is greater than its target_x position,
// for smooth animations when the player swaps pieces.
if(x > target_x)
{
	// Move towards the target_x position by 12 pixels.
	x += -10;
	y += 0;
}

// Check if the piece's y position is less than its target_y position,
// for smooth animations when the player swaps pieces.
if(y < target_y)
{
	// The object is falling, make draw_squish approach 0.8
	// using the lerp function, which helps us to create smooth
	// animations.
	draw_squish = lerp(draw_squish,0.8,0.2);

	// Move towards the target_y position by 12 pixels.
	x += 0;
	y += 10;

	// If y was less than target_y, but it has now
	// reached its target...
	if(y >= target_y)
	{
		// Set the variable draw_squish to 1.25,
		// when we draw the instance in the draw event
		// this will make it squish as it lands in place.
		draw_squish_target = 1.25;
	}
}

// Check if the piece's y position is greater than its target_y position,
// for smooth animations when the player swaps pieces.
if(y > target_y)
{
	// Move towards the target_y position by 12 pixels.
	x += 0;
	y += -10;
}

// If the variable draw_y_offset is less than 0...
if(draw_y_offset < 0)
{
	// Add 10 to draw_y_offset so that it
	// approaches 0.
	draw_y_offset += 10;
}

// If the alpha of this instance is below 1...
if(image_alpha < 1)
{
	// Add 0.1 to the alpha of this instance
	// until it reaches 1 and the instance
	// becomes fully opaque.
	image_alpha += 0.1;
}

// If the variable draw_squish is not equal to 1...
if(!(draw_squish == draw_squish_target))
{
	// Slowly return draw_squish to its target by
	// using the lerp function, which helps
	// to create smooth animations.
	draw_squish = lerp(draw_squish,draw_squish_target,0.2);

	// If draw_squish (nearly) reaches its target...
	// We're calculating if it "nearly" reaches the target because
	// the lerp function we're using for smooth animations often
	// sets variables to very tiny fractions of values rather than
	// the exact intended target.
	if(abs(draw_squish-draw_squish_target) < 0.1)
	{
		// if draw_squish (nearly) reaches draw_squish_target, always set
		// the target back to 1. This resets the squishing animation
		// when an object hits its target position.
		draw_squish_target = 1;
	}
}
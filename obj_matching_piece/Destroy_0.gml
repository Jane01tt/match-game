// If this instance was destroyed because it was part of a matching set...
if(currently_matched > 0)
{
	// When this piece is destroyed, create an instance of
	// "obj_effect_matched" in its place, which will animate
	// the match the player just made.
	// We assign its id to a temporary variable called _effect.
	var _effect = instance_create_layer(x + 50, y + 50, "Pieces", obj_effect_matched);

	// Set the image_index of the effect we just created to be 
	// the same as this piece, so it animates the right piece
	// being destroyed.
	_effect.image_index = image_index;
}
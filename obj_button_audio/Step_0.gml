// If y is not camera_get_view_height(view_camera[0])-120, the position we want
// this button to be displayed on the menu screen...
if(!(y == camera_get_view_height(view_camera[0])-120))
{
	// Smoothly animate the y position using the lerp() function.
	y = lerp(y, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])-120,0.1);
}

// Stay in the right place on screen even if the player
// resizes the window.
x = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-120;

// Smoothly animate the instance alpha towards a value of 1 using
// the lerp() function.
image_alpha = lerp(image_alpha,1,0.1);
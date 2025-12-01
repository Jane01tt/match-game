// If view width is over view height, then we are in landscape...
if(camera_get_view_width(view_camera[0]) > camera_get_view_height(view_camera[0]))
{
	// And so we are hidden!
	visible = false;
}

// Else we are in portrait...
else
{
	// And so we are visible!
	visible = true;
}
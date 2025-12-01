// If view width > view height then we are in portrait...
if(camera_get_view_width(view_camera[0]) > camera_get_view_height(view_camera[0]))
{
	// Make this obvject visible because it's landscape!
	visible = true;
}

// El we are in portrait...
else
{
	// Make this object invisible.
	visible = false;
}
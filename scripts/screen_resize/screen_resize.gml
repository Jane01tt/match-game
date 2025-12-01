
/**
 *
 */
function screen_resize_fit_area(_x, _y, _w, _h)
{
	var _view_width = _w;
	var _view_height = _h;
	var _aspect = _w / _h;
	var _has_aspect = browser_width / browser_height;
	
	// Work out width or height changes.
	// To fit the desired area we only want to expand the view.
	if (_has_aspect < _aspect)
		_view_height = _view_width / _has_aspect;
	else
		_view_width = _view_height * _has_aspect;
	
	// Work out new position.
	_x = _x + (_w / 2) - (_view_width / 2);
	_y = _y + (_h / 2) - (_view_height / 2);
	
	// Maximze the application surface, if we don't do this then it can end up
	// too small to cover the view area and become pixelated.
	// We also only do this if the new size is actually different.
	var _app_width = surface_get_width(application_surface);
	var _app_height = surface_get_height(application_surface);
	if (_app_width != browser_width || _app_height != browser_height) 
	{
		surface_resize(application_surface, browser_width, browser_height);
		
		// Checks if in browser
		if(os_browser != browser_not_a_browser)
		{
			// Sets window size to bowser dimensions
			window_set_size(browser_width, browser_height);	
		}
	}
	
	// Resize and reposition the view to our calculated values.
	camera_set_view_size(view_camera[0], _view_width, _view_height);
	camera_set_view_pos(view_camera[0], _x, _y);
}

/**
 * Do this for landscape layout.
 */
function screen_resize_landscape()
{
	screen_resize_fit_area(0, 720, 1920, 1080);
}

/**
 * Do this for portrait layout.
 */
function screen_resize_portrait()
{
	if (room == rm_menu) {
		screen_resize_fit_area(400, 480, 1100, 1560);
	} else {
		screen_resize_fit_area(400, 240, 1100, 1560);
	}
}

/**
 *
 */
function screen_resize()
{
	// Select layout and resize.
	if (browser_width > browser_height) 
	{
		screen_resize_landscape();
	} 
	else 
	{
		screen_resize_portrait();
	}
}

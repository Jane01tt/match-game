// Call the function screen_resize, which will resize
// the view to fit different devices.
// See the scripts folder for more details.
screen_resize();

if(mouse_check_button_pressed(mb_left))
{
	drag_start_x = mouse_x;
	drag_start_y = mouse_y;
}

if(mouse_check_button_released(mb_left))
{
	var _drag_end_x = mouse_x;
	var _drag_end_y = mouse_y;
	
	var _piece = instance_position(drag_start_x, drag_start_y, obj_matching_piece);
	
	var _hdrag = _drag_end_x - drag_start_x;
	var _vdrag = _drag_end_y - drag_start_y;
	
	with(_piece)
	{
		check_drag(_hdrag, _vdrag);
	}
}
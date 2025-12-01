function draw_value_bordered(_caption, _value, x, y) 
{
	draw_set_colour($FF093F68 & $ffffff);draw_set_alpha(1);

	for(_i = 0; _i < 360; _i += 36) {
		var _x = lengthdir_x(4, _i);
		var _y = lengthdir_y(4, _i);
	
		draw_text(x + _x, y + _y, string(_caption) + string(_value));
	}

	draw_set_colour($FFFFFFFF & $ffffff);draw_set_alpha(1);

	draw_text(x, y, string(_caption) + string(_value));
}
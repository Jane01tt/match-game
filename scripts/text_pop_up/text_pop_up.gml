function text_pop_up(_x,_y,_string_to_show) 
{
	// Create an instance of obj_text_popup
	var _this_popup = instance_create_layer(_x, _y, "UIElements", obj_text_popup);

	// Set the variable my_text for this new object to
	// the _string_to_show argument passed to the function.
	_this_popup.my_text = _string_to_show;
}
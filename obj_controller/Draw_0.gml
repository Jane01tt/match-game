
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _xscale = camera_get_view_width(view_camera[0]) / 1080;
var _yscale = camera_get_view_height(view_camera[0]) / 1387;
draw_sprite_ext(spr_background, 0, _x, _y, _xscale, _yscale, 0, c_white, 1);
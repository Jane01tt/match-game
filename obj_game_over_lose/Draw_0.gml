draw_set_colour(c_black);
draw_set_alpha(0.4);

var _x1 = camera_get_view_x(view_camera[0]);
var _y1 = camera_get_view_y(view_camera[0]);
var _x2 = _x1 + camera_get_view_width(view_camera[0]);
var _y2 = _y1 + camera_get_view_height(view_camera[0])
draw_rectangle(_x1, _y1, _x2, _y2, 0);

// Draw self, this will be the large panel sprite.
draw_self();

draw_set_colour($093F68);
draw_set_alpha(1);

draw_set_font(fnt_big_text);

// Draw some text on the panel.
draw_text(x + 0, y + -80, string("UNLUCKY") + "");

// Draw the decal sprite, this will be between the text
// and the buttons.
draw_sprite(spr_decal, 0, x + 0, y + -10);
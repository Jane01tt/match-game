draw_set_colour(c_black);
draw_set_alpha(0.4);

draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 0);

draw_self();

draw_set_colour($093F68);
draw_set_alpha(1);

draw_set_font(fnt_medium_text);

draw_text(x + 0, y + -80, string("GAME PAUSED...") + "");

draw_sprite(spr_decal, 0, x, y - 10);
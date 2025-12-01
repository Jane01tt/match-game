
var _x =  x - ((draw_squish - 1) * sprite_width) / 2;
var _y = y + (sprite_height - (sprite_height * (1 / draw_squish))) + draw_y_offset;
draw_sprite_ext(spr_matching_pieces, image_index, _x, _y, draw_squish, 1 / draw_squish, 0, c_white, image_alpha);
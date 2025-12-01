// Draw panel sprite.
draw_self();

// Draw the empty/background score bar.
draw_sprite_ext(spr_score_bar_empty, 0, x + 150, y + 65, 0.9, 1, 0, c_white, 1);

// Draw the score bar "filling".
// This is done use Scale X to stretch it.
draw_sprite_ext(spr_score_bar_full, 0, x + 150, y + 65, 0.9 * min(1, global.score_total / global.score_target), 1, 0, c_white, 1);

// Set the font for drawing text to font_main
draw_set_font(fnt_small_text);

// Change text alignment.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Change drawing color.
draw_set_colour($093F68);
draw_set_alpha(1);

// Draw the moves remaining icon.
draw_sprite_ext(spr_moves_icon, 0, x + 50, y + 75, 0.5, 0.5, 0, c_white, 1);

// Draw text showing the number of moves available.
draw_text(x + 90, y + 75,  + string(global.moves_available));

// Draw text to show the current score.
draw_text(x + 770, y + 75,  + string(global.score_total));

// Draw the first star on the HUD.
// star_done[n] will have a value of 0 or 1 when
// the star needs to be grey, and 2 when it needs to be
// golden, which is why we are using the clamp()
// function in the Frame box here.
draw_sprite(spr_hud_star, clamp(obj_score.star_done[0],0,1), x + 170, y + 75);

// Draw the second star on the HUD.
draw_sprite(spr_hud_star, clamp(obj_score.star_done[1],0,1), x + 400, y + 75);

// Draw the third star on the HUD.
draw_sprite(spr_hud_star, clamp(obj_score.star_done[2],0,1), x + 690, y + 75);
// Draw the panel sprite.
draw_self();

// Draw the empty/background score bar.
draw_sprite_ext(spr_score_bar_empty, 0, x + 83, y + 670, 0.9, 1, 90, $FFFFFF & $ffffff, 1);

// Draw the score bar "filling".
// This is done use Scale X to stretch it.
draw_sprite_ext(spr_score_bar_full, 0, x + 83, y + 670, 0.9 * min(1, global.score_total / global.score_target), 1, 90, $FFFFFF & $ffffff, 1);

// Set the font for drawing text to font_main
draw_set_font(fnt_score);

// Change text alignment.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Change drawing color.
draw_set_colour($093F68);
draw_set_alpha(1);

// Draw the score.
draw_text(x + 100, y + 80,  + string(global.score_total));

// Draw the first star on the HUD.
// star_done[n] will have a value of 0 or 1 when
// the star needs to be grey, and 2 when it needs to be
// golden, which is why we are using the clamp()
// function in the Frame box here.
draw_sprite(spr_hud_star, clamp(star_done[0],0,1), x + 100, y + 660);

// Draw the second star on the HUD.
draw_sprite(spr_hud_star, clamp(star_done[1],0,1), x + 100, y + 460);

// Draw the third star on the HUD.
draw_sprite(spr_hud_star, clamp(star_done[2],0,1), x + 100, y + 160);
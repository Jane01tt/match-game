// Draw self, this will be the green button base sprite.
draw_self();

// Draw the "audio" button overlay.
draw_sprite(spr_button_mute, global.audio_volume, x, y);
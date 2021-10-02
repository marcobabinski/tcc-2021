timer++

// Sombra
draw_sprite_ext(sprShadow, 0, x + 8, y + 14, 1, 1, 0, c_white, 0.25);

// Tremelique
if (summoned) {
	chargeShake = sin(timer);

	if (charged) {
		draw_sprite(sprSlimeCharged, image_index, x + chargeShake, y);
	} else {
		draw_sprite(sprSlime, image_index, x, y);
	}
}
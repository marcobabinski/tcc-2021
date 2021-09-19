timer++

// Tremelique
if (summoned) {
	chargeShake = sin(timer);

	if (charged) {
		draw_sprite(sprSlimeCharged, image_index, x + chargeShake, y);
	} else {
		draw_sprite(sprSlime, image_index, x, y);
	}
}
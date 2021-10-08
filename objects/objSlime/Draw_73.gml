with (objDoor) {
	if (getPosTile(self)[0] == getPosTile(other)[0]
	and getPosTile(self)[1] == getPosTile(other)[1]) {
		with (other) {
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
		}
	}
}
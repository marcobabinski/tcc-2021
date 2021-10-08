with (objDoor) {
	if (getPosTile(self)[0] == getPosTile(other)[0]
	and getPosTile(self)[1] == getPosTile(other)[1]) {
		// Sombra
		draw_sprite_ext(sprShadow, 0, other.x + 7.5, other.y + 16, 0.7 + (sin(other.timer * other.floatFrequency) * other.floatAmplitude/3), 0.7 + (sin(other.timer * other.floatFrequency) * other.floatAmplitude/3), 0, c_white, 0.25);

		// Aplicar
		draw_sprite(sprLosangolano, other.image_index, other.x, other.y + sin(other.timer * other.floatFrequency) * other.floatAmplitude);
	}
}
depth = -bbox_bottom;

with (objLaser) {
	if(getPosTile(self)[0] == getPosTile(other)[0]
	and getPosTile(self)[1] == getPosTile(other)[1]) {
		if (laser) {
			with (other) {
			// Timer
			timer++;

			draw_set_color(color);

			for(var i = 0; i < 16; i++) {
				draw_set_alpha(intensity - (0.1 * (i + 2)));
				draw_rectangle(x + 3, y - i + 12, x + 12, y - i + 12, false);
			}

			intensity = 0.5 * sin(timer/50) + 0.8;

			// Summonar particulas
			if (irandom_range(0, 100) > 95) {
				instance_create_layer(random_range(x, x + 12), random_range(y - 2 + 12, y - 4 + 12), "Particles", objLaserParticle);
			}
			}
		}
	}
}

// Reset alpha
draw_set_alpha(1);
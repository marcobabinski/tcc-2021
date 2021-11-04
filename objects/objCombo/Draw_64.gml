if (global.pointStreak > 1) {
	// Número da streak
	draw_set_font(fonFutileProCombo);
	
	draw_set_color(make_color_rgb(26, 28, 44));
	draw_text(SCREEN_WIDTH - 29 + shakeRangeX + 1, 30 + shakeRangeY, global.pointStreak);
	draw_text(SCREEN_WIDTH - 29 + shakeRangeX - 1, 30 + shakeRangeY, global.pointStreak);
	draw_text(SCREEN_WIDTH - 29 + shakeRangeX, 30 + 1 + shakeRangeY, global.pointStreak);
	draw_text(SCREEN_WIDTH - 29 + shakeRangeX, 30 - 1 + shakeRangeY, global.pointStreak);
	
	draw_set_color(c_white);
	draw_text(SCREEN_WIDTH - 29 + shakeRangeX, 30 + shakeRangeY, global.pointStreak);
	
	// COMBO!!
	draw_sprite_ext(sprCombo, 0, SCREEN_WIDTH - 23, 60, 1 + zoomIntensity, 1 + zoomIntensity, 0, c_white, 1);
	
	// Shake
	shakeFrequency = max(7 - global.pointStreak, 1);

	if (timer % shakeFrequency == 0) {
		shakeRangeX = random_range(-1.0 - global.pointStreak * 0.2, 1.0 + global.pointStreak * 0.2);
		shakeRangeY = random_range(-1.0 - global.pointStreak * 0.2, 1.0 + global.pointStreak * 0.2);
	}

	// Combo intensity
	zoomIntensity = sin(timer/max(19 - 3*global.pointStreak, 1)) * 0.12;
}

// Timer
timer++;
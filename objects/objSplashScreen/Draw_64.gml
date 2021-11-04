if (active) {
	if (stage == 0) {
		if (duration == 290) playCollectCoin();
		
		draw_sprite(sprSplashScreen, 0, 0, 0);
		
		// Delay
		delay = max(0, delay - 1);
		
		// Trocar stage
		if (delay <= 0) stage = 1;
		
		// Resetar opacidade
		draw_set_alpha(1);
	} else if (stage == 1) {
		opacity = max(0, opacity - 0.05);
		
		draw_set_alpha(opacity);
		
		draw_sprite(sprSplashScreen, 0, 0, 0);
		draw_set_alpha(1);
	}
}
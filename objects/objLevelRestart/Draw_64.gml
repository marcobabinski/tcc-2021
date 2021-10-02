if (active) {
	// Fade in white
	if (stage == 0) {
		if (whiteAlpha == 1) {
			stage = 1;
			room_restart();
		}
			
		// Aumentar brilho
		whiteAlpha = min(1, whiteAlpha + 0.05);
	}
	
	if (stage == 1) {
		if (restartDelay < 1) stage = 2;
		
		// Esperar
		restartDelay = max(0, restartDelay - 1);
	}
	
	// Fade out white
	if (stage == 2) {
		whiteAlpha = max(0, whiteAlpha - 0.05);
		
		if (whiteAlpha <= 0) {
			duration = 0;
		}
	}
	
	// Desenhar brilho
	draw_set_color(c_white);
	draw_set_alpha(whiteAlpha);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	
	// Resetar opacidade
	draw_set_alpha(1);
}
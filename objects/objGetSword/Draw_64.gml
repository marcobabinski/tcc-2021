if (active) {
	if (stage == 0) {
		// Timer
		timer++;
	
		// BG
		blurOpacity = min(blurOpacity + 0.05, 1);
		draw_set_alpha(blurOpacity);
		draw_sprite(sprSwordBg, 0, 0, 0);
	
		// Resetar opacidade
		draw_set_alpha(1);
		
		// Vignette
		draw_set_color(color);
		borderMove = min(borderMove + 2, 20);
	
		//Superior
		draw_rectangle(0, - 20 + borderMove, SCREEN_WIDTH, 0 + borderMove, false);
	
		//Inferior
		draw_rectangle(0, SCREEN_HEIGHT + 20 - borderMove, SCREEN_WIDTH, SCREEN_HEIGHT - borderMove, false);
	
		// Cat + Sword
		draw_sprite(sprSwordGetCat, timer/30, SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
	
		draw_sprite(sprSwordGet, 0, SCREEN_WIDTH/2 - 12, SCREEN_HEIGHT/2 - 22 - sin(timer/15));
		
		if (duration < 100) stage = 1;
	}
	
	if (stage == 1) {
		// Timer
		timer++;
	
		// BG
		blurOpacity = max(blurOpacity - 0.05, 0);
		draw_set_alpha(blurOpacity);
		draw_sprite(sprSwordBg, 0, 0, 0);
		
		// Cat + Sword
		draw_sprite(sprSwordGetCat, timer/30, SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
	
		draw_sprite(sprSwordGet, 0, SCREEN_WIDTH/2 - 12, SCREEN_HEIGHT/2 - 22 - sin(timer/15));
	
		// Resetar opacidade
		draw_set_alpha(1);
		
		// Vignette
		draw_set_color(color);
		borderMove = max(borderMove - 2, 0);
	
		//Superior
		draw_rectangle(0, - 20 + borderMove, SCREEN_WIDTH, 0 + borderMove, false);
	
		//Inferior
		draw_rectangle(0, SCREEN_HEIGHT + 20 - borderMove, SCREEN_WIDTH, SCREEN_HEIGHT - borderMove, false);
	}
}
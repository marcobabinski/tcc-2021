if (active) {
	// Fade in white
	if (stage == 0) {
		if (resize == 1) stage = 1;
		
		resize = max(1, resize - 1);
	}
	
	// Gato pisca e estrela
	if (stage == 1) {
		if (portalDelay == 0) stage = 2;
		
		if (portalDelay == 25) {
			instance_create_layer(objPlayer.x + 12, objPlayer.y + 4, "Particles", objLittleStar);
			//objPlayer.state = playerStateNextLevel;
		}
		
		portalDelay = max(0, portalDelay - 1);
	}
	
	if (stage == 2) {
		draw_set_color(color);
		//draw_rectangle(SCREEN_WIDTH/2, SCREEN_HEIGHT/2, 300, 300, false);
	}
	
	// Desenhar cat splash
	draw_sprite_ext(sprNextLevelCatScreen, 0, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, resize, resize, 0, c_white, 1);
	
	// Resetar opacidade
	draw_set_alpha(1);
}

// Debug
if (false) {
	draw_set_color(c_black);
	draw_set_font(fonHeartbit2);
	draw_text(2, 2, "whiteAlpha: " +string(whiteAlpha));
	draw_text(2, 12, "restartDelay: " +string(restartDelay));
	draw_text(2, 22, "duration: " +string(duration));
}
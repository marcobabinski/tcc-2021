if (active) {
	// Fade in white
	if (stage == 0) {
		if (resize == 1) stage = 1;
		objPlayer.state = playerStateNextLevel;
		resize = max(1, resize - 1);
		
		// Desenhar cat splash
		draw_sprite_ext(sprNextLevelCatScreen, 0, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, resize, resize, 0, c_white, 1);
	}
	
	// Gato pisca e estrela
	if (stage == 1) {
		//if (portalDelay == 0) stage = 2;
		
		// Estrelinha
		if (portalDelay == 90) {
			instance_create_layer(objPlayer.x + 12, objPlayer.y + 4, "Particles", objLittleStar);
		}
		
		// Escurece tela
		if (portalDelay < 40) {
			draw_set_alpha((40 - portalDelay) / 10);
			draw_set_color(color);
			draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
		}
		
		if ((40 - portalDelay) / 10 == 1) {
			stage = 2;
			passLevel();
		}
		
		portalDelay = max(0, portalDelay - 1);
		
		// Desenhar cat splash
		draw_sprite_ext(sprNextLevelCatScreen, 0, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, resize, resize, 0, c_white, 1);
	}
	
	if (stage == 2) {
		draw_set_alpha((40 - portalDelay) / 10);
		draw_set_color(color);
		//draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
		draw_rectangle((336/disappearDelay) - 16, 0, 320, 180, false);
		
		draw_sprite(sprNextLevelSpikes, 0, 336/disappearDelay - 32, 0)
		
		disappearDelay = max(0, disappearDelay - 1);
		// objPlayer.state = playerStateFree;
		
		if (disappearDelay < 1) {
			duration = 0;
			levelTitleEvent(objGame.levelTitle[global.level], 200);
		}
	}
	
	// Resetar opacidade
	draw_set_alpha(1);
}

// Debug
if (true) {
	draw_set_color(c_black);
	draw_set_font(fonHeartbit2);
	draw_text(2, 2, "resize: " +string(resize));
	draw_text(2, 12, "portalDelay: " +string(portalDelay));
	draw_text(2, 22, "disappearDelay: " +string(disappearDelay));
	draw_text(2, 32, "stage: " +string(stage));
	draw_text(2, 42, "duration: " +string(duration));
}
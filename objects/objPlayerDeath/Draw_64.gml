if (active) {
	// Escurecimento de tela
	draw_set_color(c_black);
	draw_set_alpha(darkBg);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	
	// Redesenhar player e matador
	if (variable_instance_exists(highlightEntity.id, "floatAmplitude")) var _float = sin(highlightEntity.timer * highlightEntity.floatFrequency) * highlightEntity.floatAmplitude;
	else var _float = 0;
	
	draw_set_alpha(1);
	draw_sprite(objPlayer.sprite_index, objPlayer.image_index, SCREEN_WIDTH/2 - (objCamera.x - objPlayer.x), SCREEN_HEIGHT/2 - (objCamera.y - objPlayer.y));
	
	if (instance_exists(highlightEntity)) {
		draw_sprite(highlightEntity.sprite_index, highlightEntity.image_index, SCREEN_WIDTH/2 - (objCamera.x - highlightEntity.x), SCREEN_HEIGHT/2 - (objCamera.y - highlightEntity.y) + _float);
	}
	
	if (stage == 0) {
		if (darkBg == 0.8) {
			stage = 1;
			objPlayer.image_speed = 1;
		}
		
		objPlayer.state = playerStateDeath;
		objPlayer.image_index = 0;
		darkBg = min(0.8, darkBg + 0.02);
	} else if (stage = 1) {
		
	} else if (stage = 2) {
		// Fundo
		draw_set_color(make_color_rgb(26, 28, 44));
		draw_rectangle(0, progressY, SCREEN_WIDTH, progressY + SCREEN_HEIGHT, false);
		
		// Spikes
		draw_sprite_ext(sprNextLevelSpikes, 0, -25, progressY + 16 + SCREEN_HEIGHT, 1, 2, 90, c_white, 1);
		draw_sprite_ext(sprNextLevelSpikes, 0, -25, progressY - 16, -1, 2, 90, c_white, 1);
		
		progressY += (targetY-progressY)/15;
		
		if (round(progressY) == round(targetY)) {
			stage = 3;
			darkBg = 0;
			targetY = SCREEN_HEIGHT + 16;
			room_restart();
		} 
	} else if (stage = 3) {
		// Fundo
		draw_set_color(make_color_rgb(26, 28, 44));
		draw_rectangle(0, progressY, SCREEN_WIDTH, progressY + SCREEN_HEIGHT, false);
		
		// Spikes
		draw_sprite_ext(sprNextLevelSpikes, 0, -25, progressY + 16 + SCREEN_HEIGHT, 1, 2, 90, c_white, 1);
		draw_sprite_ext(sprNextLevelSpikes, 0, -25, progressY - 16, -1, 2, 90, c_white, 1);
		
		progressY += (targetY-progressY)/10;
	}
}
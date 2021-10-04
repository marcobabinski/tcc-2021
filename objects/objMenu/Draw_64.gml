// Background black
if (menu > -1) blackBg = min(0.6, blackBg + 0.05);
else blackBg = max(0, blackBg - 0.05)

draw_set_color(c_black);
draw_set_alpha(blackBg);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);

// Menu in-game
if (menu == 0) {
	// "Pausado"
	draw_sprite(sprPausedText, 0, SCREEN_WIDTH/2, 20);
	
	// Tela inicial
	if (ig_screen == 0) {
		// Mudar pos
		if (keyDown - keyUp != 0) {
			ig_pos = clamp(ig_pos + keyDown - keyUp, 0, 3);
		}
		
		// Ações
		if (keyConfirm) {
			switch (ig_pos) {
			    case 0:
			        menu = -1;
			        break;
				case 1:
			        ig_screen = 1;
					ig_pos = 0;
			        break;
				case 2:
			        menu = -1;
			        break;
				case 3:
			        game_end();
			        break;
			    default:
			        menu = -1;
			        break;
			}
		}
		
		// Botões tela inicial
		draw_set_color(make_color_rgb(239, 125, 87));
		for (var i = 0; i < 4; i++) {
			if (ig_pos == i) {
				draw_set_color(make_color_rgb(255, 205, 117));
				draw_roundrect(105, 47 + 25 * i, 215, 50 + 25 * i + 23, false);
			} else {
				draw_set_color(make_color_rgb(239, 125, 87));
				draw_roundrect(110, 50 + 25 * i, 210, 50 + 25 * i + 20, false);
			}
		}
	
		draw_set_font(fonHeartbit2)
		draw_set_color(c_white);
		for (var i = 0; i < 4; i++) {
			draw_text(SCREEN_WIDTH/2 - string_width(ig_mn_text[i])/2, 50 + 25 * i + 3, ig_mn_text[i]);
		}
	} else if (ig_screen == 1) {
		// Voltar
		if (keyCancel) {
			ig_screen = 0;
			ig_pos = 0;
		}
		
		// Mudar pos
		if (keyDown - keyUp != 0) {
			ig_pos = clamp(ig_pos + keyDown - keyUp, 0, 3);
		}
		
		// Baixar/Aumentar volume
		if (keyRight - keyLeft != 0) {
			switch (ig_pos) {
			    case 0:
			        global.musicVolume = clamp(global.musicVolume + ((keyRight - keyLeft) * 0.1), 0, 1);
			        break;
				case 1:
			        global.soundVolume = clamp(global.soundVolume + ((keyRight - keyLeft) * 0.1), 0, 1);
			        break;
			    default:
			        break;
			}
		}
		
		// Switch fullscreen // Quit
		if (keyConfirm) {
			switch (ig_pos) {
			    case 2:
			        global.fullscreen = !global.fullscreen
			        break;
				case 3:
			        ig_screen = 0;
					ig_pos = 0;
			        break;
			    default:
			        break;
			}
		}
		
		// Verificar selecionado
		if (ig_pos == 0) currentSelected = 1;
		else currentSelected = 0;
		
		// Música
		draw_sprite(sprMusic, 0, 110, 50 + 25);
		draw_sprite(sprConfigAdjust, currentSelected, 130, 50 + 25);
		for (var i = 0; i < 10; i++) {
			if (i * 0.1 < global.musicVolume) draw_set_color(c_white);
			else draw_set_color(c_dkgrey);
			draw_rectangle(140 + (6 * i), 50 + 23, 140 + (6 * i) + 3, 50 + 24 + 16, false)
		}
		draw_sprite_ext(sprConfigAdjust, currentSelected, 208, 50 + 25, -1, 1, 0, c_white, 1);
		
		if (ig_pos == 1) currentSelected = 1;
		else currentSelected = 0;
		
		// Sons
		draw_sprite(sprSound, 0, 110, 80 + 25);
		draw_sprite(sprConfigAdjust, currentSelected, 130, 80 + 25);
		for (var i = 0; i < 10; i++) {
			if (i * 0.1 < global.soundVolume) draw_set_color(c_white);
			else draw_set_color(c_dkgrey);
			draw_rectangle(140 + (6 * i), 80 + 23, 140 + (6 * i) + 3, 80 + 24 + 16, false)
		}
		draw_sprite_ext(sprConfigAdjust, currentSelected, 208, 80 + 25, -1, 1, 0, c_white, 1);
		
		// Fullscreen
		if (ig_pos == 2) draw_set_color(make_color_rgb(239, 125, 87))
		else draw_set_color(c_white);
		
		draw_sprite(sprCheckbox, global.fullscreen, 130, 125);
		draw_text(156, 127, "Tela Cheia");
		
		// Voltar
		if (ig_pos == 3) draw_set_color(make_color_rgb(255, 205, 117));
		else draw_set_color(make_color_rgb(239, 125, 87));

		draw_roundrect(110, 125 + 25, 210, 125 + 25 + 20, false);
		draw_set_color(c_white);
		draw_text(SCREEN_WIDTH/2 - string_width("Voltar")/2, 153, "Voltar");
		
	}
}
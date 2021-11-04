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
			playMenuBeep();
			ig_pos = clamp(ig_pos + keyDown - keyUp, 0, 3);
		}
		
		// Ações
		if (keyConfirm) {
			switch (ig_pos) {
			    case 0:
					playMenuSelect();
			        menu = -1;
			        break;
				case 1:
					playMenuSelect();
			        ig_screen = 1;
					ig_pos = 0;
			        break;
				case 2:
					playMenuSelect();
			        ig_screen = 2;
					ig_pos = 0;
			        break;
				case 3:
					// You really want to quit
					playMenuSelect();
			        ig_screen = 3;
					ig_pos = 0;
			        break;
			    default:
					playMenuSelect();
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
		// Tela opções
	} else if (ig_screen == 1) {
		draw_set_font(fonHeartbit2)
		
		// Voltar
		if (keyCancel) {
			ig_screen = 0;
			ig_pos = 1;
		}
		
		// Mudar pos
		if (keyDown - keyUp != 0) {
			playMenuBeep();
			ig_pos = clamp(ig_pos + keyDown - keyUp, 0, 3);
		}
		
		// Baixar/Aumentar volume
		if (keyRight - keyLeft != 0) {
			switch (ig_pos) {
			    case 0:
					playMenuBeep();
			        global.musicVolume = clamp(global.musicVolume + ((keyRight - keyLeft) * 0.1), 0, 1);
			        break;
				case 1:
					playMenuBeep();
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
					playMenuSelect();
			        global.fullscreen = !global.fullscreen
			        break;
				case 3:
					playMenuSelect();
			        ig_screen = 0;
					ig_pos = 1;
			        break;
			    default:
			        break;
			}
		}
		
		// Verificar selecionado
		if (ig_pos == 0) currentSelected = 1;
		else currentSelected = 0;
		
		// Música
		draw_sprite(sprMusic, 0, 110, 50);
		draw_sprite(sprConfigAdjust, currentSelected, 130, 50);
		for (var i = 0; i < 10; i++) {
			if (i * 0.1 < global.musicVolume) draw_set_color(c_white);
			else draw_set_color(c_dkgrey);
			draw_rectangle(140 + (6 * i), 25 + 23, 140 + (6 * i) + 3, 25 + 24 + 16, false)
		}
		draw_sprite_ext(sprConfigAdjust, currentSelected, 208, 50, -1, 1, 0, c_white, 1);
		
		if (ig_pos == 1) currentSelected = 1;
		else currentSelected = 0;
		
		// Sons
		draw_sprite(sprSound, 0, 110, 80);
		draw_sprite(sprConfigAdjust, currentSelected, 130, 80);
		for (var i = 0; i < 10; i++) {
			if (i * 0.1 < global.soundVolume) draw_set_color(c_white);
			else draw_set_color(c_dkgrey);
			draw_rectangle(140 + (6 * i), 55 + 23, 140 + (6 * i) + 3, 55 + 24 + 16, false)
		}
		draw_sprite_ext(sprConfigAdjust, currentSelected, 208, 80, -1, 1, 0, c_white, 1);
		
		// Fullscreen
		if (ig_pos == 2) draw_set_color(make_color_rgb(239, 125, 87))
		else draw_set_color(c_white);
		
		draw_sprite(sprCheckbox, global.fullscreen, 130, 100);
		draw_text(150, 102, "Tela Cheia");
		
		// Voltar
		if (ig_pos == 3) draw_set_color(make_color_rgb(255, 205, 117));
		else draw_set_color(make_color_rgb(239, 125, 87));

		draw_roundrect(110, 125, 210, 125 + 20, false);
		draw_set_color(c_white);
		draw_text(SCREEN_WIDTH/2 - string_width("Voltar")/2, 128, "Voltar");
		
	} else if (ig_screen = 2) {
		// Voltar
		if (keyCancel and ig_sub < 0) {
			ig_screen = 0;
			ig_pos = 2;
		}
		
		// Mudar pos
		if (keyDown - keyUp != 0 and ig_sub < 0) {
			playMenuBeep();
			ig_pos = clamp(ig_pos + keyDown - keyUp, 0, 2);
		}
		
		// Botões tela inicial
		draw_set_color(make_color_rgb(239, 125, 87));
		for (var i = 1; i < 3; i++) {
			if (ig_pos == i) {
				draw_set_color(make_color_rgb(255, 205, 117));
				draw_roundrect(105, 47 + 25 * i, 215, 50 + 25 * i + 23, false);
			} else {
				draw_set_color(make_color_rgb(239, 125, 87));
				draw_roundrect(110, 50 + 25 * i, 210, 50 + 25 * i + 20, false);
			}
		}
	
		// Texto
		draw_set_font(fonHeartbit2)
		draw_set_color(c_white);
		_text = ["", "Confirmar senha", "Voltar"];
		for (var i = 1; i < 3; i++) {
			draw_text(SCREEN_WIDTH/2 - string_width(_text[i])/2, 50 + 25 * i + 3, _text[i]);
		}
		
		// Selecionar
		if (ig_pos == 0  and ig_sub < 0) {
			draw_set_color(make_color_rgb(255, 205, 117));
			draw_rectangle(123, 40, 133 + 60 + 5, 45 + 16 + 5, false);
		}
		
		// Ícones
		for(var i = 0; i < 3; i++) {
			draw_sprite(sprPassword, ig_pass[i], 133 + 20*i, 45);
		}
		
		// Ícones dessa fase
		_text = "- Senha desta fase -";
		_width = string_width(_text);
		draw_set_color(c_white);
		draw_text(SCREEN_WIDTH/2 - _width/2, 125, _text);
		for(var i = 0; i < 3; i++) {
			draw_sprite(sprPassword, objGame.levelPass[global.level][i], 133 + 20*i, 140);
		}
		
		// Ativos
		if (keyConfirm and ig_sub < 0) {
			switch (ig_pos) {
			    case 0:
					// Entrar em modo pass
					playMenuSelect();
					ig_sub = 0;
			        break;
				case 1:
					// Aplicar pass
					var _passed = false;
					var _level = -1;
					for (var i = 0; i < array_length(objGame.levelPass); i++) {
						_passed = true;
						if (ig_pass[0] != objGame.levelPass[i][0]) _passed = false;
						if (ig_pass[1] != objGame.levelPass[i][1]) _passed = false;
						if (ig_pass[2] != objGame.levelPass[i][2]) _passed = false;
						
						if (_passed) _level = i
					}
					
					if (_level > -1) {
						playNextLevelMusic();
						global.level = _level;
						if (_level != 0) global.sword = true;
						menu = -1;
					} else {
						playDeathMusic();
					}
			        break;
				case 2:
					// Voltar
					playMenuSelect();
					ig_screen = 0;
					ig_pos = 2;
			    default:
			        break;
			}
		}
		
		// Sessão de alteração
		if (ig_sub > -1) {
			// Sair
			if (keyCancel) {
				ig_sub = -1;
				ig_pos = 0;
			}
			
			// Trocar pro lado
			if (keyRight - keyLeft != 0) {
				playMenuBeep();
				ig_alt_pos = clamp(ig_alt_pos + keyRight - keyLeft, 0, 2);
			}
			
			// Trocar pra cima
			if (keyDown - keyUp != 0) {
				playMenuBeep();
				ig_pass[ig_alt_pos] = clamp(ig_pass[ig_alt_pos] + keyUp - keyDown, 0, 5);
			}
			
			// Marcar selecionado
			draw_set_color(make_color_rgb(255, 205, 117));
			draw_rectangle(133 + 20*ig_alt_pos, 45, 133 + 20*ig_alt_pos + 16, 45 + 16, true);
			
			// triangulos
			if (ig_pass[ig_alt_pos] < 5) draw_triangle(133 + 20*ig_alt_pos, 40, 133 + 20*ig_alt_pos + 16, 40, 133 + 20*ig_alt_pos + 8, 35, false);
			if (ig_pass[ig_alt_pos] > 0) draw_triangle(133 + 20*ig_alt_pos, 40 + 24, 133 + 20*ig_alt_pos + 16, 40 + 24, 133 + 20*ig_alt_pos + 8, 45 + 24, false);
		}
	} else if (ig_screen == 3) {
		// Texto
		_qText = "Tem certeza que deseja sair?";
		draw_set_color(c_white);
		draw_set_font(fonHeartbit2);
		draw_text(SCREEN_WIDTH/2 - string_width(_qText)/2, 50, _qText);
		
		// Botões
		if (ig_pos == 0) draw_set_color(make_color_rgb(255, 205, 117)); else draw_set_color(make_color_rgb(239, 125, 87));
		draw_roundrect(SCREEN_WIDTH/2 - 50, 70, SCREEN_WIDTH/2 - 5, 70 + 26, false);
		if (ig_pos == 1) draw_set_color(make_color_rgb(255, 205, 117)); else draw_set_color(make_color_rgb(239, 125, 87));
		draw_roundrect(SCREEN_WIDTH/2 + 50, 70, SCREEN_WIDTH/2 + 5, 70 + 26, false);
		
		draw_set_color(c_white);
		draw_set_font(fonHeartbit2);
		draw_text(SCREEN_WIDTH/2 - 34, 76, "Nao");
		draw_text(SCREEN_WIDTH/2 + 21, 76, "Sim");
		
		// Não perca o progresso!
		// Ícones dessa fase
		_text = "Guarde seu progresso!!!";
		_width = string_width(_text);
		draw_set_color(c_white);
		draw_text(SCREEN_WIDTH/2 - _width/2, 105, _text);
		
		_text = "Anote este codigo para voltar depois!";
		_width = string_width(_text);
		draw_set_color(c_white);
		draw_text(SCREEN_WIDTH/2 - _width/2, 115, _text);
		for(var i = 0; i < 3; i++) {
			draw_sprite(sprPassword, objGame.levelPass[global.level][i], 133 + 20*i, 140);
		}
		
		// Sair
		if (keyCancel) {
			ig_screen = 0;
			ig_pos = 3;
		}
		
		// Alternar
		if (keyRight - keyLeft != 0) {
			playMenuBeep();
			ig_pos = clamp(ig_pos + keyRight - keyLeft, 0, 1);
		}
		
		// Ativos
		if (keyConfirm) {
			switch (ig_pos) {
			    case 0:
					playMenuSelect();
			        ig_screen = 0;
					ig_pos = 3;
			        break;
				case 1:
					playMenuSelect();
			        game_end();
			        break;
			    default:
			        break;
			}
		}
	}
}
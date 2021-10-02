if (active) {
	// Aumentar barra
	levelH = min(10, levelH + 1);
	
	// Desenhar barra
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 90 - levelH, 320, 90 + levelH, false);
	
	// Mover texto
	levelX += ((SCREEN_WIDTH/2 - string_width(levelTitle)) - levelX)/30;
	
	// Desenhar texto
	draw_set_font(fonFutilePro);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(levelX, 82, levelTitle)
} else {
	// Ocultar barra
	if (levelH > 0) {
		// Reduzir e desenhar barra
		levelH = max(0, levelH - 1);
	
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(0, 90 - levelH, 320, 90 + levelH, false);
	
		//Resetar alpha
		draw_set_alpha(1);
	}
}
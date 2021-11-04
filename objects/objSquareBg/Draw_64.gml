// Contador
timer++;

// Desenhar escura
draw_set_color(c_light);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);

draw_set_color(c_dark);

for (var i = -1; i < SCREEN_WIDTH/16 + 32; i++) {
	for (var j = 0; j < SCREEN_HEIGHT; j += 2) {
		if (i % 2 == 0) draw_rectangle(-16 + (timer % 32) + (16 * i), 16 * j, -16 + (timer % 32) + (16 * i) + 16, 16*j + 16, false);
		else draw_rectangle(-16 + (timer % 32) + (16 * i), 16 * j + 16, -16 + (timer % 32) + (16 * i) + 16, 16*j + 16 + 16, false);
	}
}

draw_set_font(fonFutilePro);
draw_set_color(c_white);
writeTextFullWave("PARABENS! VOCE TERMINOU AS FASES!", 1*16, 2*16);

draw_set_font(fonHeartbit2);
writeTextVertWave("- Marco Andre Babinski -", 6 * 16, 3 * 16);

draw_text(6.2 * 16, 145, "Pressione ESC para sair");
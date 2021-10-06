timer++;

// Escrita daora
draw_set_font(fonHeartbit2);
draw_set_color(c_white);

if (global.level == 0) {
	writeTextVertWave("Use as setinhas ou o WASD para se mover", 17*16, 33*16);
	writeTextVertWave("Acostume-se com os movimentos neste labirinto!", 52*16, 46*16);
	writeTextVertWave("Pise nos quadrados azuis para usar como checkpoint!", 7*16, 50*16);
	writeTextVertWave("Para atacar, se mova por cima do alvo!", 16*16, 56*16);
	writeTextVertWave("Os espinhos e lasers tambem se alteram apos voce!", 45*16, 72*16);
	writeTextShaky("Cuidado! Os inimigos se movem conforme voce se move!", 34*16, 51*16);
}
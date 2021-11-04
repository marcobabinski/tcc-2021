// Cores
c_dark = make_color_rgb(26, 28, 44);
c_light = make_color_rgb(36, 39, 61);

// Pontuação
scoreFinal = global.score;
string(scoreFinal);
while (string_length(scoreFinal) < 6) {
	scoreFinal = string_insert("0", scoreFinal, 0);
}
scoreFinal = string_insert("Pontuacao: ", scoreFinal, 0);

// Timer
timer = 0;
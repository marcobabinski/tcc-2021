// Desenhar logo
draw_sprite(sprScore, 0, SCREEN_WIDTH - sprite_width - 8, 4);

// Pontuação
draw_set_color(c_white);
draw_set_font(fonArcadeClassic);

_score = global.score + global.levelScore;
string(_score);
while(string_length(_score) < 6) {
	_score = string_insert("0", _score, 0);
} 

// Outline
draw_set_color(make_color_rgb(26, 28, 44));
draw_text(SCREEN_WIDTH - sprite_width/2 - 8 - string_width(_score)/2 + 1, sprite_height + 6, _score);
draw_text(SCREEN_WIDTH - sprite_width/2 - 8 - string_width(_score)/2 - 1, sprite_height + 6, _score);
draw_text(SCREEN_WIDTH - sprite_width/2 - 8 - string_width(_score)/2, sprite_height + 6 + 1, _score);
draw_text(SCREEN_WIDTH - sprite_width/2 - 8 - string_width(_score)/2, sprite_height + 6 - 1, _score);

// Default
draw_set_color(c_white);
draw_text(SCREEN_WIDTH - sprite_width/2 - 8 - string_width(_score)/2, sprite_height + 6, _score);


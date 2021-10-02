// Startar animação
if (not active and levelTitle != "" and duration > 0) {
	// Setar configs
	active = true;
	levelH = 0;
	draw_set_font(fonFutilePro);
	levelX = string_width(levelTitle) * -1;
}

// Encerrar animação
if (active) {
	duration = max(0, duration - 1);
	if (duration < 1) {
		// Resetar configs
		active = false;
		levelTitle = "";
		//levelH = 0;
		duration = 0;
	}
}
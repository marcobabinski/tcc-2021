// Startar animação
if (not active and duration > 0) {
	// Setar configs
	// playNextLevelMusic();
	active = true;
	blurOpacity = 0;
	borderMove = 0;
	stage = 0;
}

// Encerrar animação
if (active) {
	duration = max(0, duration - 1);
	if (duration < 1) {
		// Resetar configs
		active = false;
		blurOpacity = 0;
		borderMove = 0;
		stage = 0;
		duration = 0;
	}
}
// Startar animação
if (not active and duration > 0) {
	// Setar configs
	active = true;
	whiteAlpha = 0;
	restartDelay = 50;
	stage = 0;
}

// Encerrar animação
if (active) {
	duration = max(0, duration - 1);
	if (duration < 1) {
		// Resetar configs
		active = false;
		whiteAlpha = 0;
		restartDelay = 50;
		duration = 0;
		stage = 0;
	}
}
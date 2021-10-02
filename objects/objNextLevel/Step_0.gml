// Startar animação
if (not active and duration > 0) {
	// Setar configs
	active = true;
	resize = 10;
	portalDelay = 120;
	disappearDelay = 50;
	stage = 0;
}

// Encerrar animação
if (active) {
	duration = max(0, duration - 1);
	if (duration < 1) {
		// Resetar configs
		active = false;
		resize = 10;
		portalDelay = 120;
		disappearDelay = 50;
		stage = 0;
		duration = 0;
	}
}
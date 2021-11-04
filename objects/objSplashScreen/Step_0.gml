// Startar animação
if (not active and duration > 0) {
	// Setar configs
	// playNextLevelMusic();
	active = true;
	opacity = 1;
	delay = 250;
	stage = 0;
}

// Encerrar animação
if (active) {
	duration = max(0, duration - 1);
	if (duration < 1) {
		// Resetar configs
		active = false;
		opacity = 1.5;
		delay = 250;
		stage = 0;
		duration = 0;
	}
}

// Finalização
if (not active) instance_destroy(self);
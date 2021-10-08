// Startar animação
if (not active and duration > 0) {
	// Setar configs
	audio_play_sound(sndDeathMsc, 10, false);
	active = true;
	darkBg = 0;
	progressY = -SCREEN_HEIGHT;
	targetY = 0;
	stage = 0;
	
	// Dismiss instance
	if (not instance_exists(highlightEntity)) highlightEntity = objHighlightDummy;
}

// Encerrar animação
if (active) {
	duration = max(0, duration - 1);
	if (duration < 1) {
		// Resetar configs
		active = false;
		darkBg = 0;
		progressY = -SCREEN_HEIGHT;
		targetY = 0;
		duration = 0;
		stage = 0;
	}
}
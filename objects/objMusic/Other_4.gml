if (global.level > 9) {
	audio_stop_sound(currentMusic);
	instance_destroy(self);
}
if (objMenu.menu < 0) {
	currentVolume = global.musicVolume;
	audio_sound_gain(currentMusic, currentVolume, 10);
} else {
	currentVolume = global.musicVolume * 0.5;
	audio_sound_gain(currentMusic, currentVolume, 10);
}

if (objPlayer.state != playerStateFree
and objPlayer.state != playerStateAttacking
and objPlayer.state != playerStateMoving
and objPlayer.state != playerStateTeleporting
and global.status != "p") {
	currentVolume = 0;
	audio_sound_gain(currentMusic, currentVolume, 500);
} else {
	currentVolume = global.musicVolume;
	audio_sound_gain(currentMusic, currentVolume, 500);
}
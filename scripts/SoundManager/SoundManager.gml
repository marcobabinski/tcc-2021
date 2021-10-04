function playHit() {
	var _hitList = [sndHit1, sndHit2, sndHit3];
	var _sound = _hitList[irandom_range(0, array_length(_hitList) - 1)];
	
	audio_sound_gain(_sound, global.soundVolume, 0);
	audio_play_sound(_sound, 10, false);
}

function playMoveStep() {
	var _list = [sndMove1];
	var _pitch = random_range(0.6, 1.4);
	var _sound = _list[irandom_range(0, array_length(_list) - 1)];
	var _volume = 0.5 * global.soundVolume;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_sound_pitch(_sound, _pitch);
	audio_play_sound(_sound, 10, false);
}
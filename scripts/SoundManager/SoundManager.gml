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

function playMenuBeep() {
	var _volume = 0.5 * global.soundVolume;
	var _sound = sndMenu1;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_play_sound(_sound, 10, false);
}

function playMenuSelect() {
	var _volume = 0.7 * global.soundVolume;
	var _sound = sndMenuSelect;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_play_sound(_sound, 10, false);
}

function playVaseBreak() {
	var _list = [sndVaseBreak2];
	var _pitch = random_range(1.5, 2.9);
	var _sound = _list[irandom_range(0, array_length(_list) - 1)];
	var _volume = 0.4 * global.soundVolume;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_sound_pitch(_sound, _pitch);
	audio_play_sound(_sound, 10, false);
}

function playTeleport() {
	var _list = [sndTeleport];
	var _pitch = random_range(0.8, 1.2);
	var _sound = _list[irandom_range(0, array_length(_list) - 1)];
	var _volume = 0.5 * global.soundVolume;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_sound_pitch(_sound, _pitch);
	audio_play_sound(_sound, 10, false);
}

function playStarBlink() {
	var _volume = 0.4 * global.soundVolume;
	var _sound = sndStarBlink;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_play_sound(_sound, 10, false);
}

function playButtonPress() {
	var _volume = 0.7 * global.soundVolume;
	var _sound = sndButtonPress;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_play_sound(_sound, 10, false);
}

function playButtonRelease() {
	var _volume = 0.7 * global.soundVolume;
	var _sound = sndButtonRelease;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_play_sound(_sound, 10, false);
}

function playDeath() {
	var _volume = 0.7 * global.soundVolume;
	var _sound = sndDeath;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_play_sound(_sound, 10, false);
}

function playNextLevelMusic() {
	var _volume = global.soundVolume;
	var _sound = sndNextLevel;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_play_sound(_sound, 10, false);
}

function playDeathMusic() {
	var _volume = global.soundVolume;
	var _sound = sndDeathMsc;
	
	audio_sound_gain(_sound, _volume, 0);
	audio_play_sound(_sound, 10, false);
}
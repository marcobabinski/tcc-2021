currentMusic = mscMain2;
currentVolume = global.musicVolume;

audio_sound_gain(currentMusic, global.musicVolume * 0.5, 0);
audio_play_sound(currentMusic, 1000, true);
if (moves > 0) {
	if (spikesLevel < 2) {
		spikesLevel++;
	} else {
		// Espinha os alvos
		spikesLevel = 0;
	}
	
	moves--;
}

if (spikesLevel == 0) sprite_index = sprSpikes0;
if (spikesLevel == 1) sprite_index = sprSpikes1;
if (spikesLevel == 2) sprite_index = sprSpikes2;
if (moves > 0) {
	if (spikesLevel < 2) {
		spikesLevel++;
	} else {
		spikesLevel = 0;
	}
	
	moves--;
}

if (spikesLevel == 2) {
	with all {
		if (depth == layer_get_depth(layer_get_id("Enemies"))
			or object_index == objPlayer) {
				if (getPosTile(self)[0] == getPosTile(other)[0]
				and getPosTile(self)[1] == getPosTile(other)[1]) {
					instance_destroy(self);
			}	
		}
	}
}

if (spikesLevel == 0) sprite_index = sprSpikes0;
if (spikesLevel == 1) sprite_index = sprSpikes1;
if (spikesLevel == 2) sprite_index = sprSpikes2;
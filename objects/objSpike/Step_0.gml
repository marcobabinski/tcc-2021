if (moves > 0) {
	
	switch (spikesLevel) {
		case 0:
			spikesLevel++;
			break;
		case 1:
			spikesLevel++;
			with all {
				if (depth == layer_get_depth(layer_get_id("Enemies"))
					or object_index == objPlayer) {
						if (getPosTile(self)[0] == getPosTile(other)[0]
						and getPosTile(self)[1] == getPosTile(other)[1]) {
							instance_destroy(self);
					}	
				}
			}
			break;
		case 2:
			spikesLevel = 0;
			break;
	}
	
	moves--;
}

image_index = spikesLevel;
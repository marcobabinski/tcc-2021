if (moves > 0) {
	laser = !laser;
	
	if (laser) {
		with all {
			if (depth == layer_get_depth(layer_get_id("Enemies"))
				or object_index == objPlayer) {
					if (getPosTile(self)[0] == getPosTile(other)[0]
					and getPosTile(self)[1] == getPosTile(other)[1]) {
						killEntity(self);
				}	
			}
		}
	}
	
	moves--;
}

image_index = laser;
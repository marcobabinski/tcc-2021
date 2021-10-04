/// @description
if (global.turn == "o" and moves > 0) {
	if (getPosTile(self)[0] == getPosTile(objPlayer)[0]
		and getPosTile(self)[1] == getPosTile(objPlayer)[1]) {
		nextLevelEvent(300);
	}
	
	moves--;
}



if (layer_exists(layer_get_id("Particles"))) {
	if (random_range(0, 100) > 90) {
		instance_create_layer(random_range(x, x + 15), random_range(y + 8, y + 4), "Particles", objPortalParticle);
	}
}
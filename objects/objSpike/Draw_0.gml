draw_self();

// Brililim
if (spikesLevel == 2) {
	var _shine = irandom_range(0, 100);
	if (_shine > 99) {
		instance_create_depth(x + random_range(-8, 8), y + random_range(-8, 8), layer_get_depth(layer_get_id("Particles")), objSpikeShine);
	}
}
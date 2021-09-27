function slimeKill() {
	instance_destroy(self);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
}

function losangleKill() {
	instance_destroy(self);
	instance_create_layer(x, y, "Particles", objExplosion);
}

function particleMoveSmoke() {
	instance_create_layer(x, y, "Particles", objMoveSmoke);
}
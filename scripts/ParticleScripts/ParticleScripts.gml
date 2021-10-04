function slimeKill() {
	instance_destroy(self);
	playHit();
	ScreenShake(5, 10);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
}

function losangleKill() {
	instance_destroy(self);
	playHit();
	ScreenShake(5, 10);
	instance_create_layer(x, y, "Particles", objExplosion);
}

function particleMoveSmoke() {
	playMoveStep();
	instance_create_layer(x, y, "Particles", objMoveSmoke);
}

function jarDestroy() {
	instance_destroy(self);
	for (var i = 0; i < irandom_range(1, 3); i++) {
		instance_create_layer(x, y, "Particles", objJarFrag);
	}
}
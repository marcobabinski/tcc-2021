function slimeKill() {
	addPoints(1000, x, y-8);
	global.pointStreak++;
	instance_destroy(self);
	playHit();
	ScreenShake(5, 10);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
	instance_create_layer(x, y, "Particles", objSlimeParticle);
}

function losangleKill() {
	addPoints(1500, x, y-8);
	global.pointStreak++;
	instance_destroy(self);
	playHit();
	ScreenShake(5, 10);
	instance_create_layer(x, y, "Particles", objExplosion);
}

function particleMoveSmoke() {
	global.pointStreak = max(0, global.pointStreak - 1);
	playMoveStep();
	instance_create_layer(x, y, "Particles", objMoveSmoke);
}

function jarDestroy() {
	addPoints(500, x, y-8);
	global.pointStreak++;
	playVaseBreak();
	instance_destroy(self);
	for (var i = 0; i < irandom_range(1, 3); i++) {
		instance_create_layer(x, y, "Particles", objJarFrag);
	}
	
	// Gerar drop
	_drop = irandom_range(1, 100);
	if (_drop < 6) {
		createDiamond(getPosTile(self)[0], getPosTile(self)[1]);
	} else if (_drop < 16) {
		createRupee(getPosTile(self)[0], getPosTile(self)[1]);
	} else if (_drop < 36) {
		createCoin(getPosTile(self)[0], getPosTile(self)[1]);
	}
}
if (moves > 0) {
	if (getPosTile(objPlayer)[0] == getPosTile(self)[0]
	and getPosTile(objPlayer)[1] == getPosTile(self)[1]) {
		objPlayer.state = playerStateTeleporting;
		objPlayer.sprite_index = sprPlayerTeleport;
		objPlayer.image_index = 0;
		objPlayer.image_speed = 1;
		objPlayer.moving = true;
		objPlayer.targetX = targetPos[0] * 16;
		objPlayer.targetY = targetPos[1] * 16;
		for (var i = 0; i < 3; i++) {
			with instance_create_layer(objPlayer.x + 8, objPlayer.y + 8, "Particles", objTeleportCat) {
				moveDelay = 30 + (i * 10);
			}
		}
	}
	
	//moves = 0;
	
	moves--;
}

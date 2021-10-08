function playerStateFree() {
sprite_index = sprPlayerIdle;
image_speed = 0;

if (moves > 0) {
	if ((keyRight - keyLeft != 0) xor (keyDown - keyUp != 0)) {
		if (keyRight - keyLeft != 0 and moves > 0) {
			with all {
				if (depth == layer_get_depth(layer_get_id("Enemies"))) {
					if (getPosTile(self)[0] == getPosTile(objPlayer)[0] + (objPlayer.keyRight - objPlayer.keyLeft)
						and getPosTile(self)[1] == getPosTile(objPlayer)[1]) {
							killEntity(self);
							other.moves--;
							other.attacking = true;
							other.state = playerStateAttacking;
							other.attackDuration = 15;
					}
				}
				
				if (depth == layer_get_depth(layer_get_id("Terrain"))) {
					if (getPosTile(self)[0] == getPosTile(objPlayer)[0] + (objPlayer.keyRight - objPlayer.keyLeft)
						and getPosTile(self)[1] == getPosTile(objPlayer)[1]) {
							if (object_index == objJar) {
								global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = FLOOR;
								killEntity(self);
								other.moves--;
								other.attacking = true;
								other.state = playerStateAttacking;
								other.attackDuration = 15;
							}
							//if (object_index == objGoal) {
							//	show_message("alo");
							//}
					}
				}
			}
			
			if (global.turn == "p" and moves > 0) {
				if (tileAt(x div 16 + (keyRight - keyLeft), y div 16) == FLOOR
				or tileAt(x div 16 + (keyRight - keyLeft), y div 16) == GOAL
				or tileAt(x div 16 + (keyRight - keyLeft), y div 16) == PLAYERONLY) {
					//x += 16 * sign(keyRight - keyLeft);
					particleMoveSmoke();
					targetX = x + (16 * sign(keyRight - keyLeft));
					targetY = y;
					state = playerStateMoving;
					moving = true;
					moves--;
					//passTurn();
				}
			}
		} else if (keyDown - keyUp != 0 and moves > 0) {
			with all {
				if (depth == layer_get_depth(layer_get_id("Enemies"))) {
					if (getPosTile(self)[0] == getPosTile(objPlayer)[0]
						and getPosTile(self)[1] == getPosTile(objPlayer)[1] + (objPlayer.keyDown - objPlayer.keyUp)) {
							killEntity(self);
							other.moves--;
							other.attacking = true;
							other.state = playerStateAttacking;
							other.attackDuration = 15;
					}
				}
				
				if (depth == layer_get_depth(layer_get_id("Terrain"))) {
					if (getPosTile(self)[0] == getPosTile(objPlayer)[0]
						and getPosTile(self)[1] == getPosTile(objPlayer)[1] + (objPlayer.keyDown - objPlayer.keyUp)) {
							if (object_index == objJar) {
								global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = FLOOR;
								killEntity(self);
								other.moves--;
								other.attacking = true;
								other.state = playerStateAttacking;
								other.attackDuration = 15;
							}
							//if (object_index == objGoal) {
							//passLevel();
							//}
					}
				}
			}
			
			if (global.turn == "p" and moves > 0) {
				if (tileAt(x div 16, y div 16  + (keyDown - keyUp)) == FLOOR
				or tileAt(x div 16, y div 16  + (keyDown - keyUp)) == GOAL
				or tileAt(x div 16, y div 16  + (keyDown - keyUp)) == PLAYERONLY) {
					//y += 16 * sign(keyDown - keyUp);
					particleMoveSmoke();
					targetY = y + (16 * sign(keyDown - keyUp));
					targetX = x;
					state = playerStateMoving;
					moving = true;
					moves--;
					//passTurn();
				}
			}
		}
		
		// Atualizar sprite
		if (keyRight) facing = 0;
		if (keyUp) facing = 1;
		if (keyLeft) facing = 2;
		if (keyDown) facing = 3;
	}
}

}

function playerStateMoving() {
	sprite_index = sprPlayerIdle;
	image_speed = 0;
	if (round(x) != targetX or round(y) != targetY) {
		x += (targetX - x)/3;
		y += (targetY - y)/3;
	} else {
		x = round(x);
		y = round(y);
		state = playerStateFree;
		moving = false;
	}
}

function playerStateAttacking() {
	sprite_index = sprPlayerIdle;
	image_speed = 0;
	if (attackDuration > 0) {
		objSword.attacking = true;
		attackDuration = max(0, attackDuration - 1);
	} else {
		state = playerStateFree;
		objSword.attacking = false;
		attacking = false;
		attackDuration = 0;
	}
}

function playerStateTeleporting() {
	if (image_index == 14) {
		image_speed = 0;
		if (round(x) != targetX or round(y) != targetY) {
			x += (targetX - x)/30;
			y += (targetY - y)/30;
		} else {
			x = round(x);
			y = round(y);
			image_speed = -1;
		}
	}
	
	if (image_index == 0 and image_speed == -1) {
			facing = 3;
			state = playerStateFree;
			moving = false;
	}
}

function movingStretch() {
	if (moving) {
		image_xscale = min(1, image_yscale + 0.05);
		image_yscale = max(0.9, image_yscale - 0.05);
	} else {
		image_yscale = min(1, image_yscale + 0.05);
		image_yscale = max(0.9, image_yscale - 0.05);
	}
}

function playerDeath() {
	playerDeathEvent(270);
}

function playerStateNextLevel() {
	if (objNextLevel.portalDelay > 90) {
		image_index = 3;
	}
	
	if (objNextLevel.portalDelay < 90 and objNextLevel.portalDelay > 60) {
		image_index = 0;
		sprite_index = sprPlayerComplete;
	}
	
	if (objNextLevel.portalDelay < 60) {
		image_index += 0.7;
		//image_speed = 1;
	}
	
	if (objNextLevel.duration < 1) {
		state = playerStateFree;
	}
	
}

function playerStateDeath() {
	sprite_index = sprPlayerDead;
	
	if (image_index == 15) playDeath();
	
	if (image_index == sprite_get_number(sprPlayerDead) - 1) {
		image_speed = 0;
		objPlayerDeath.stage = 2;
	}
	
	if (objPlayerDeath.duration < 1) {
		state = playerStateFree;
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateMachine(){

}

function playerStateFree() {
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
								instance_destroy(self);
								passTurn();
							}
							if (object_index == objGoal) {
								passLevel();
							}
					}
				}
			}
			
			if (global.turn == "p" and moves > 0) {
				if (tileAt(x div 16 + (keyRight - keyLeft), y div 16) == FLOOR) {
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
								instance_destroy(self);
								passTurn();
							}
							if (object_index == objGoal) {
								passLevel();
							}
					}
				}
			}
			
			if (global.turn == "p" and moves > 0) {
				if (tileAt(x div 16, y div 16  + (keyDown - keyUp)) == FLOOR) {
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

function movingStretch() {
	if (moving) {
		image_xscale = min(1, image_yscale + 0.05);
		image_yscale = max(0.9, image_yscale - 0.05);
	} else {
		image_yscale = min(1, image_yscale + 0.05);
		image_yscale = max(0.9, image_yscale - 0.05);
	}
}
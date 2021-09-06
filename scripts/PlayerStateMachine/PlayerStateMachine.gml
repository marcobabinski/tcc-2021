// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateMachine(){

}

function playerStateFree() {
	if ((keyRight - keyLeft != 0) xor (keyDown - keyUp != 0)) {
		if (keyRight - keyLeft != 0) {
			with all {
				if (depth == layer_get_depth(layer_get_id("Enemies"))) {
					if (getPosTile(self)[0] == getPosTile(objPlayer)[0] + (objPlayer.keyRight - objPlayer.keyLeft)
						and getPosTile(self)[1] == getPosTile(objPlayer)[1]) {
							instance_destroy(self);
							passTurn();
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
			
			if (global.turn == "p") {
				if (tileAt(x div 16 + (keyRight - keyLeft), y div 16) == FLOOR) {
					x += 16 * sign(keyRight - keyLeft);
					passTurn();
				}
			}
		} else if (keyDown - keyUp != 0) {
			with all {
				if (depth == layer_get_depth(layer_get_id("Enemies"))) {
					if (getPosTile(self)[0] == getPosTile(objPlayer)[0]
						and getPosTile(self)[1] == getPosTile(objPlayer)[1] + (objPlayer.keyDown - objPlayer.keyUp)) {
							instance_destroy(self);
							passTurn();
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
			
			if (global.turn == "p") {
				if (tileAt(x div 16, y div 16  + (keyDown - keyUp)) == FLOOR) {
					y += 16 * sign(keyDown - keyUp);
					passTurn();
				}
			}
		}
	}
}
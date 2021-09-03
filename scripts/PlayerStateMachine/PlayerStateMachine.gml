// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateMachine(){

}

function playerStateFree() {
	if ((keyRight - keyLeft != 0) xor (keyDown - keyUp != 0)) {
		if (keyRight - keyLeft != 0) {
			if (tileAt(x div 16 + (keyRight - keyLeft), y div 16) == FLOOR) {
				x += 16 * sign(keyRight - keyLeft);
				passTurn();
			}
		} else if (keyDown - keyUp != 0) {
			if (tileAt(x div 16, y div 16  + (keyDown - keyUp)) == FLOOR) {
				y += 16 * sign(keyDown - keyUp);
				passTurn();
			}
		}
	}
}
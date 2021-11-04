function addPoints(_qt, _x, _y) {
	global.levelScore += _qt + 250 * global.pointStreak;
	with (instance_create_layer(_x, _y, "Particles", objPoints)) {
		points = _qt + 250 * global.pointStreak;
	}
}

function applyPoints() {
	global.score += global.levelScore;
	global.levelScore = 0;
}
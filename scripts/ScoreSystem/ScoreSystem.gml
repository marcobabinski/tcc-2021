function addPoints(_qt, _x, _y) {
	global.levelScore += _qt + 250 * global.pointStreak;
	with (instance_create_layer(_x, _y, "Particles", objPoints)) {
		points = _qt + 250 * global.pointStreak;
	}
	if (global.pointStreak > 0) playCombo();
}

function addPointsNoBonus(_qt, _x, _y) {
	global.levelScore += _qt;
	with (instance_create_layer(_x, _y, "Particles", objPoints)) {
		points = _qt;
	}
}


function applyPoints() {
	global.score += global.levelScore;
	global.levelScore = 0;
}

function createCoin(_x, _y) {
	with (instance_create_layer(_x * 16, _y * 16, "Particles", objCoin)) {
		pos = [_x, _y];
	}
}

function createRupee(_x, _y) {
	with (instance_create_layer(_x * 16, _y * 16, "Particles", objRupee)) {
		pos = [_x, _y];
	}
}

function createDiamond(_x, _y) {
	with (instance_create_layer(_x * 16, _y * 16, "Particles", objDiamond)) {
		pos = [_x, _y];
	}
}
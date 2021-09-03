function passTurn() {
	if (global.turn == "p") {
		with all {
			if (depth == layer_get_depth(layer_get_id("Enemies"))) {
				moves = 1;
			}
		}
		global.turn = "e";
	} else if (global.turn == "e") {
		global.turn = "p";
	}
}

function listEnemies() {
	var _depth = layer_get_depth(layer_get_id("Enemies"));
	var _enemies = [];
	
	with all {
		if (depth == _depth) _enemies[array_length(_enemies)] = [x div 16, y div 16];
	}
	
	return _enemies;
}

function enemiesDone() {
	var _depth = layer_get_depth(layer_get_id("Enemies"));
	var _done = true;
	
	with all {
		if (depth == _depth) {
			if (moves > 0) _done = false;
		};
	}
	
	return _done;
}

function tileAt(_tx, _ty) {
	return global.collisionField[_tx][_ty];
}
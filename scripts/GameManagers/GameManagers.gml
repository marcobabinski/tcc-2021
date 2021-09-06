function passTurn() {
	if (global.turn == "p") {
		with all {
			if (depth == layer_get_depth(layer_get_id("Enemies"))) {
				moves = 1;
			}
		}
		global.turn = "e";
	} else if (global.turn == "e") {
		with all {
			if (depth == layer_get_depth(layer_get_id("Terrain"))) {
				if (object_index == objSpike
				or object_index == objLaser) {
					moves = 1;
				}
			}
		}
		global.turn = "o";
	} else if (global.turn == "o") {
		global.turn = "p";
	}
}

function passLevel() {
	global.level++;
}

function listEnemies() {
	var _depth = layer_get_depth(layer_get_id("Enemies"));
	var _enemies = [];
	
	with all {
		if (depth == _depth) _enemies[array_length(_enemies)] = [x div 16, y div 16];
	}
	
	return _enemies;
}

function listTerrains() {
	var _depth = layer_get_depth(layer_get_id("Terrain"));
	var _terrains = [];
	
	with all {
		if (depth == _depth) _terrains[array_length(_terrains)] = [x div 16, y div 16, object_index];
	}
	
	return _terrains;
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

function terrainsDone() {
	var _depth = layer_get_depth(layer_get_id("Terrain"));
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

function getPosTile(_target) {
	return [_target.x div 16, _target.y div 16];
}

function summonRange(_s, _d, _target) {
	if ((getPosTile(_target)[0] >= _s[0]
	and getPosTile(_target)[0] <= _d[0])
	and (getPosTile(_target)[1] >= _s[1]
	and getPosTile(_target)[1] <= _d[1])) {
		return true;
	} else return false;
}
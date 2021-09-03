function aiRandom() {
	var _x = x div 16; // Tile x atual
	var _y = y div 16; // Tile y atual
	var _targetx = undefined; // Tile x alvo
	var _targety = undefined; // Tile y alvo
	var _dir = undefined; // Direção (Hor ou Ver)
	
	do {
		_dir = choose(0, 1);
		if (_dir == 0) { // Horizontal
			_targetx = _x + choose(-1, 1);
			_targety = _y;
		} else { // Vertical
			_targety = _y + choose(-1, 1);
			_targetx = _x;
		}
	} until(tilemap_get(global.tilemap, _targetx, _targety) == 1 or tilemap_get(global.tilemap, _targetx, _targety) == 2) 
	
	objPlayer.x = _targetx * 16;
	objPlayer.y = _targety * 16;
}

function aiBlindSearch() {
	var _x = x div 16; // Tile x atual
	var _y = y div 16; // Tile y atual
	var _targetx = undefined; // Tile x alvo
	var _targety = undefined; // Tile y alvo
	
	for(var i = 0; i < tilemap_get_height(global.tilemap); i++) {
		for(var j = 0; j < tilemap_get_width(global.tilemap); j++) {
			if (tilemap_get(global.tilemap, i, j) == 2) {
				_targetx = j;
				_targety = i;
			}
		}
	}
	
	
	if (_targetx - _x != 0 and (tilemap_get(global.tilemap, _x + sign(_targetx - _x), _y) == 1
	or tilemap_get(global.tilemap, _x + sign(_targetx - _x), _y) == 2)) {
		objPlayer.x += 16 * sign(_targetx - _x);
	} else if (_targety - _y != 0 and (tilemap_get(global.tilemap, _x, _y + sign(_targety - _y)) == 1
	or tilemap_get(global.tilemap, _x, _y + sign(_targety - _y)) == 2)) {
		objPlayer.y += 16 * sign(_targety - _y);
	}
	
}

function aiAStar() {
	
}
function manhattanDistance(_x1, _y1, _x2, _y2) {
	var _dx = abs(_x1 - _x2);
	var _dy = abs(_y1 - _y2);
	return _dx + _dy;
}

function findGoal() {
	for (var i = 0; i < tilemap_get_height(global.tilemap); i++) {
		for (var j = 0; j < tilemap_get_width(global.tilemap); j++) {
			if (tilemap_get(global.tilemap, j, i)) == 2 return [j, i];
		}
	}
}

function addNode(_arrayInput, _x, _y, _px, _py, _start, _dest) {
	var _array = _arrayInput;
	
	_array[array_length(_array)] = [
		[_x, _y],
		[_px, _py],
		manhattanDistance(_x, _start[0], _y, _start[1]),
		manhattanDistance(_x, _dest[0], _y, _dest[1]),
		manhattanDistance(_x, _start[0], _y, _start[1]) + manhattanDistance(_x, _dest[0], _y, _dest[1])
	]
	
	return _array;
}

function sortNodes(_arrayInput) {
	// Arrays para operar
	var _initArray = _arrayInput;
	var _sortedArray = [];
	
	// Menor
	var _lowest = 0;
	
	for (var i = 0; i < array_length(_initArray); i++) {
		if (_initArray[i][4] < _initArray[_lowest][4]) _lowest = i;
	}
	
	
}
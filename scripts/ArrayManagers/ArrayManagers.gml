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
		manhattanDistance(_x, _y, _start[0], _start[1]),
		manhattanDistance(_x, _y, _dest[0], _dest[1]),
		manhattanDistance(_x, _y, _start[0], _start[1]) + manhattanDistance(_x, _y, _dest[0], _dest[1])
	]
	
	return _array;
}

function sortNodes(_arrayInput) {
	// Arrays para operar
	var _initArray = _arrayInput;
	var _sortedArray = [];
	
	// Menor
	var _lowest = 0;
	var _lowestNumber = 0;
	
	while (array_length(_initArray) > 0) {
		// show_message(string(_initArray) +"\n" +string(_sortedArray))
		
		// Define o menor como o primeiro
		_lowest = 0;
		_lowestNumber = _initArray[0][4];
		
		// Procura o menor valor do array inicial
		for (var i = 0; i < array_length(_initArray); i++) {
			//show_message("Lowest: " +string(_lowestNumber));
			if (_initArray[i][4] < _lowestNumber) {
				_lowest = i;
				_lowestNumber = _initArray[i][4];
			}
		}
		
		// Passa esse valor para o novo em ordem
		array_insert(_sortedArray, array_length(_sortedArray), _initArray[_lowest]);
		
		// Remove do array inicial
		array_delete(_initArray, _lowest, 1);
	}
	
	return _sortedArray;
	
}

function getNeighbors(_actualNode) {
	// Possíveis vizinhos
	var _possibleNeighbors = [];
	
	// Impassáveis
	var _blockList = [objGoal, objCheckpoint, objTeleporter];
	
	// Listar possibilidades
	_possibleNeighbors[0] = [_actualNode[0] + 1, _actualNode[1]]; // Direita
	_possibleNeighbors[1] = [_actualNode[0], _actualNode[1] - 1]; // Cima
	_possibleNeighbors[2] = [_actualNode[0] - 1, _actualNode[1]]; // Esquerda
	_possibleNeighbors[3] = [_actualNode[0], _actualNode[1] + 1]; // Baixo
	
	//show_message(_possibleNeighbors);
	
	// Filtrar possibilidades
	for (var i = array_length(_possibleNeighbors) - 1; i >= 0; i--) {
		var _impossible = false;
		
		// Tiles indevidos
		if (tilemap_get(global.tilemap, _possibleNeighbors[i][0], _possibleNeighbors[i][1]) == VOID
			or tilemap_get(global.tilemap, _possibleNeighbors[i][0], _possibleNeighbors[i][1]) == WALL
			or tilemap_get(global.tilemap, _possibleNeighbors[i][0], _possibleNeighbors[i][1]) == GOAL
			or global.collisionField[_possibleNeighbors[i][0]][_possibleNeighbors[i][1]] == OBSTACLE
			or global.collisionField[_possibleNeighbors[i][0]][_possibleNeighbors[i][1]] == PLAYERONLY) {
			_impossible = true;
		}
		
		// Inimigo no spot
		if (abs(_possibleNeighbors[i][0] - getPosTile(self)[0]) + abs(_possibleNeighbors[i][1] - getPosTile(self)[1]) == 1) {
			if (not _impossible) {
				with objSkull {
					if (depth == layer_get_depth(layer_get_id("Enemies"))) {
						if (_possibleNeighbors[i][0] == targetX div 16 and _possibleNeighbors[i][1] == targetY div 16) {
							_impossible = true;
						}
					}
				}
			
				with objSlime {
					if (depth == layer_get_depth(layer_get_id("Enemies"))) {
						if (_possibleNeighbors[i][0] == targetX div 16 and _possibleNeighbors[i][1] == targetY div 16) {
							_impossible = true;
						}
					}
				}
			}
		}
		
		//show_message("O tile " +string(_possibleNeighbors[i]) +" está a " +string(1));
		
		if (_impossible) array_delete(_possibleNeighbors, i, 1);
		
		//with all {
		//		if (object_index == objJar
		//		or object_index == objGoal) {
		//			if (getPosTile(self)[0] == _possibleNeighbors[i - 1][0]
		//			and getPosTile(self)[1] == _possibleNeighbors[i][1]) {
		//				array_delete(_possibleNeighbors, i, 1);
		//			}
		//		}
		//	}
		
		
	}
	
	// Jarros / Portal
	for (var i = array_length(_possibleNeighbors) - 1; i >= 0; i--) {
			
	}
	//show_message(_possibleNeighbors);
	
	// Retornar nós
	return _possibleNeighbors;
}

function indexOfNode(_array, _node) {
	var _index = -1;
	
	for (var i = 0; i < array_length(_array); i++) {
		if (_array[i][0][0] == _node[0] and _array[i][0][1] == _node[1]) {
			_index = i;
			break
		}
	}
	
	return _index;
}
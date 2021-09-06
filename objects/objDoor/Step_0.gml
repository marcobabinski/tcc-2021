// Verificar se á algo acima
var _ontop = false;

// Player
if (getPosTile(objPlayer)[0] == getPosTile(other)[0]
	and getPosTile(objPlayer)[1] == getPosTile(other)[1]) {
		_ontop = true;
	}
	
// Inimigos
for (var i = 0; i < array_length(listEnemies()); i++) {
	if (listEnemies()[i][0] == getPosTile(self)[0]
	and listEnemies()[i][1] == getPosTile(self)[1]) {
		_ontop = true;
	}
}

// Verificar botão
with objButton {
	if (getPosTile(self)[0] == other.buttonPos[0]
	and getPosTile(self)[1] == other.buttonPos[1]) {
		if (pressed) {
			other.opened = true;
		} else {
			if (_ontop) {
				other.opened = true;
			} else {
				other.opened = false;
			}
		}
	}
}

// Inverter
if (reversed and not reverseLock) {
	opened = true;
	
	if (not _ontop and summonRange(actionRange[0], actionRange[1], objPlayer)) {
		reverseLock = true;
	}
}

if (reverseLock) opened = false;

// Barrar e atualizar sprite
if (opened) {
	global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = FLOOR;
	image_index = 1;
} else {
	global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = OBSTACLE;
	image_index = 0;
}
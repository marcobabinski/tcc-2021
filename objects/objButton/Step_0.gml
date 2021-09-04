// Verificar se há algo em cima
var _pressing = false;

// Player
if (getPosTile(objPlayer)[0] == getPosTile(self)[0]
	and getPosTile(objPlayer)[1] == getPosTile(self)[1]) {
	pressed = true;	
	_pressing = true;
} else { // Inimigos
	for (var i = 0; i < array_length(listEnemies()); i++) {
		if (listEnemies()[i][0] == getPosTile(self)[0]
			and listEnemies()[i][1] == getPosTile(self)[1]) {
			pressed = true;
			_pressing = true;
		}
	}
}

if (not keepPressed and not _pressing and pressed) pressed = false;

// Sprite update
// Tipo
if (keepPressed) sprite_index = sprDoorButton;
if (not keepPressed) sprite_index = sprDoorButtonWhile;

// Pressionado
if (pressed) image_index = 1;
if (not pressed) image_index = 0;
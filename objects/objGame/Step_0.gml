/// @desc
// Passar turno dos inimigos
if (global.turn == "e") {
	if (enemiesDone()) {
		passTurn();
	}
}

// Passar turno dos obstáculos
if (global.turn == "o") {
	if (terrainsDone()) {
		passTurn();
	}
}

// Mudar de fase
if (room != levels[global.level]) {
	room_goto(levels[global.level]);
}

// Player morto
if (not instance_exists(objPlayer)) {
	show_message("Tu murió");
}
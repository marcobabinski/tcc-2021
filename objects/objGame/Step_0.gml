/// @desc
// Passar turno do player
if (global.turn == "p") {
	if (objPlayer.moves <= 0 and objPlayer.moving == false and objPlayer.attacking == false) {
		passTurn();
	}
}

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

// Warning Tile
if (global.turn == "p") {
	warningDelay = max(0, warningDelay - 1);
	warningCountdown = max(0, warningCountdown - 1);
}

// Contagem regressiva da cutscene
//if (global.status == "c") {
//	if (global.cutsceneTime == 0) {
//		global.status = "g";
//	} else global.cutsceneTime--;
//}

// Tornar modo cutscene
if (checkCutscene()) global.status = "c";
else global.status = "g";

// Mudar de fase
if (room != levels[global.level]) {
	room_goto(levels[global.level]);
}

// Player morto
if (not instance_exists(objPlayer)) {
	show_message("Player foi morto :(");
}

// Checar menu
if (objMenu.menu > -1) {
	global.status = "m";
}

// Tela cheia
if (global.fullscreen != window_get_fullscreen()) {
	window_set_fullscreen(global.fullscreen);
}
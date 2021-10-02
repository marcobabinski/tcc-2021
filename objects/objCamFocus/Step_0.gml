// Se estiver em jogo, siga o jogador
if (global.status == "g") {
	with objPlayer {
		other.x = x + 8;
		other.y = y + 8;
	}
} else if (global.status == "c") {
	if (objFocus != noone) {
	
	} else {
		//x = focus[0] * 16;
		//y = focus[1] * 16
	}
}
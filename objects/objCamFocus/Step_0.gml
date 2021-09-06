// Se estiver em jogo, siga o jogador
if (global.status == "g") {
	with objPlayer {
		other.x = x;
		other.y = y;
	}
}
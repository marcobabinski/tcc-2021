switch (global.turn) {
	case "p":
		sprite_index = sprTurnPlayer;
		break;
	case "e":
		sprite_index = sprTurnEnemies;
		break;
	case "o":
		sprite_index = sprTurnObjects;
		break;
}

x = objPlayer.x;
y = objPlayer.y - 50;
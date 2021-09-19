// Ver posição
if (not attacking) {
	switch (objPlayer.facing) {
	case 0:
		targetx = objPlayer.x;
		targety = objPlayer.y + 10;
		image_xscale = 1;
		image_yscale = 1;
		image_angle = 0;
		depth = objPlayer.depth - 1;
		break;
	case 1:
		targetx = objPlayer.x + 20;
		targety = objPlayer.y + 2;
		image_xscale = -1;
		image_yscale = 1;
		image_angle = 0;
		depth = objPlayer.depth + 1;
		break;
	case 2:
		targetx = objPlayer.x + 14;
		targety = objPlayer.y;
		image_xscale = -1;
		image_yscale = 1;
		image_angle = 0;
		depth = objPlayer.depth + 1;
		break;
	case 3:
		targetx = objPlayer.x - 4;
		targety = objPlayer.y + 2;
		image_xscale = 1;
		image_yscale = 1;
		image_angle = 0;
		depth = objPlayer.depth - 1;
		break;
	default:
		targetx = objPlayer.x - 12;
		targety = objPlayer.y - 4;
		break;
}
} else {
	switch (objPlayer.facing) {
	case 0:
		targetx = objPlayer.x;
		targety = objPlayer.y + 10;
		image_xscale = 1;
		image_yscale = 1;
		image_angle = 90;
		depth = objPlayer.depth - 1;
		break;
	case 1:
		targetx = objPlayer.x + 20;
		targety = objPlayer.y - 4;
		image_xscale = 1;
		image_yscale = 1;
		image_angle = 180;
		depth = objPlayer.depth + 1;
		break;
	case 2:
		targetx = objPlayer.x + 14;
		targety = objPlayer.y;
		image_xscale = -1;
		image_yscale = 1;
		image_angle = 270;
		depth = objPlayer.depth + 1;
		break;
	case 3:
		targetx = objPlayer.x - 4;
		targety = objPlayer.y + 14;
		image_xscale = 1;
		image_yscale = 1;
		image_angle = 0;
		depth = objPlayer.depth - 1;
		break;
	default:
		targetx = objPlayer.x - 12;
		targety = objPlayer.y - 4;
		break;
}
}

depth = -bbox_bottom;

// Reposicionar
if (x != targetx) {
	x += (targetx - x)/6;
}

if (y != targety) {
	y += (targety - y)/6;
}
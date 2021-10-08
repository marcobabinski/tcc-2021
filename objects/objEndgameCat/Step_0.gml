if (not moving and not objEndgameSlime.moving) {
	xTo += 16;
	moving = true;
}

if (moving) {
	x += (xTo - x)/5;
	
	if (round(x) == round(xTo)) {
		moving = false;
	}
}

if (x > SCREEN_WIDTH) {
	x = -16;
	xTo = -16;
	moving = false;
}
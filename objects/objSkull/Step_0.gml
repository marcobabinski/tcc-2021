if (moves > 0 and not reached) {
	script_execute(ai);
	moves--;
}

if (round(x) != targetX or round(y) != targetY) {
		x += (targetX - x)/2;
		y += (targetY - y)/2;
	} else {
		x = round(x);
		y = round(y);
}
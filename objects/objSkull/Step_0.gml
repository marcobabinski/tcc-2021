if (moves > 0 and not inactive) {
	script_execute(ai);
	moves--;
} else {
	moves = 0;
}

if (round(x) != targetX or round(y) != targetY) {
		x += (targetX - x)/2;
		y += (targetY - y)/2;
	} else {
		x = round(x);
		y = round(y);
}

// Reabilitar
if (inactive) {
	with objButton {
		if (getPosTile(self)[0] == other.buttonDisable[0]
		and getPosTile(self)[1] == other.buttonDisable[1]) {
			if (self.pressed) other.inactive = false;
		}
	}
}
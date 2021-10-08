if (summoned and not inactive) {
	if (moves > 0) {
		if (charged) {
			script_execute(ai);
			charged = false;
			moves--;
		} else if (not charged) {
			charged = true;
			moves--;
		}
	}
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

image_alpha = summoned;

if (charged) sprite_index = sprSlimeCharged;
if (not charged) sprite_index = sprSlime;
if (summoned) {
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
	if (summonRange(summonSpot[0], summonSpot[1], objPlayer)) {
		summoned = true;
	}
	
	moves = 0;
}

if (round(x) != targetX or round(y) != targetY) {
		x += (targetX - x)/2;
		y += (targetY - y)/2;
	} else {
		x = round(x);
		y = round(y);
}

image_alpha = summoned;

if (charged) sprite_index = sprSlimeCharged;
if (not charged) sprite_index = sprSlime;
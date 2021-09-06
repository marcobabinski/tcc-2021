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

image_alpha = summoned;

if (charged) sprite_index = sprSlimeCharged;
if (not charged) sprite_index = sprSlime;
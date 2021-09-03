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

if (charged) sprite_index = sprSlimeCharged;
if (not charged) sprite_index = sprSlime;
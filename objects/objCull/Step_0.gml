if (moves > 0) {
	startx = objCamFocus.x - SCREEN_WIDTH/2 - 64;
	endx = objCamFocus.x + SCREEN_WIDTH/2 + 64;

	starty = objCamFocus.y - SCREEN_HEIGHT/2 - 64;
	endy = objCamFocus.y + SCREEN_HEIGHT/2 + 64;

	for (var i = 0; i < array_length(deactiveList); i++) {
		with (deactiveList[i]) {
			if (cullRange(self)) {
				//array_insert(other.deactived, array_length(other.deactived), id);
				instance_deactivate_object(self);
			}
		}
	}

	instance_activate_region(startx, starty, SCREEN_WIDTH + 64, SCREEN_HEIGHT + 64, true);
	
	moves--;
} 

if (objPlayer.state == playerStateTeleporting) {
	instance_activate_region(startx, starty, SCREEN_WIDTH + 64, SCREEN_HEIGHT + 64, true);
}
if (moves > 0) {
	startx = objCamFocus.x - SCREEN_WIDTH/2 - 32;
	endx = objCamFocus.x + SCREEN_WIDTH/2 + 32;

	starty = objCamFocus.y - SCREEN_HEIGHT/2 - 32;
	endy = objCamFocus.y + SCREEN_HEIGHT/2 + 32;

	for (var i = 0; i < array_length(deactiveList); i++) {
		with (deactiveList[i]) {
			if (cullRange(self)) {
				//array_insert(other.deactived, array_length(other.deactived), id);
				instance_deactivate_object(self);
			}
		}
	}

	instance_activate_region(startx, starty, SCREEN_WIDTH + 32, SCREEN_HEIGHT + 32, true);
	
	moves--;
}
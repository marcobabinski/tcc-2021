// Sword Verify
if (not opened) {
	if (global.sword) opened = true;
}

// Barrar e atualizar sprite
if (opened) {
	global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = FLOOR;
	image_index = min(11, image_index + 1);
} else {
	global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = OBSTACLE;
	image_index = max(0, image_index - 1);
}

// Já foi aberta?
if (opened) alreadyOpened = true;

if (not opened) depth = -bbox_bottom;
else depth = -bbox_top;
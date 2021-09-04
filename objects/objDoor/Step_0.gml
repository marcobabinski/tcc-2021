// Verificar botão
with objButton {
	if (getPosTile(self)[0] == other.buttonPos[0]
	and getPosTile(self)[1] == other.buttonPos[1]) {
		other.opened = pressed;
	}
}

// Barrar e atualizar sprite
if (opened) {
	global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = FLOOR;
	image_index = 1;
} else {
	global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = OBSTACLE;
	image_index = 0;
}
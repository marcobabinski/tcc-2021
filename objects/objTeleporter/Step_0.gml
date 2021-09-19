if (moves > 0) {
	if (getPosTile(objPlayer)[0] == getPosTile(self)[0]
	and getPosTile(objPlayer)[1] == getPosTile(self)[1]) {
		objPlayer.x = targetPos[0] * 16;
		objPlayer.y = targetPos[1] * 16;
	}
	
	moves--;
}

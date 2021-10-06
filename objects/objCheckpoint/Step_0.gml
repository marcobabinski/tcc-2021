if (moves > 0) {
	if (getPosTile(objPlayer)[0] == getPosTile(self)[0]
	and getPosTile(objPlayer)[1] == getPosTile(self)[1]) {
		global.checkpoint = checkpointId;
		checkpointRestartEvent(300);
	}
	
	moves--;
}


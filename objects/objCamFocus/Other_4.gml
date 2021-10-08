// Reposicionar Player
if (global.checkpoint == -1) {
	x = objGame.levelStart[global.level][0] * 16
	y = objGame.levelStart[global.level][1] * 16
} else {
	with objCheckpoint {
		if (global.checkpoint == checkpointId) {
			x = getPosTile(self)[0] * 16
			y = getPosTile(self)[1] * 16
		}
	}
}
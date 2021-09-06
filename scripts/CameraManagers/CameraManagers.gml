function ScreenShake(magnitude, frames) {
	with (objCamera) {
		if (magnitude > shakeRemain) {
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = frames;
		}
	}
}
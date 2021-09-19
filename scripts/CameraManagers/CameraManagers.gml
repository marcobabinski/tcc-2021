function ScreenShake(magnitude, frames) {
	with (objCamera) {
		if (magnitude > shakeRemain) {
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = frames;
		}
	}
}

function focusEvent(_target, _time) {
	global.status = "c";
	global.cutsceneTime = _time;
	
	with (objCamFocus) {
		focus = _target;
	}
}
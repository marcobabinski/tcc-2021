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

function levelTitleEvent(_title, _duration) {
	objLevelTitle.levelTitle = _title;
	objLevelTitle.duration = _duration;
}

function checkpointRestartEvent(_duration) {
	objLevelRestart.duration = _duration;
}

function nextLevelEvent(_duration) {
	objNextLevel.duration = _duration;
}

function playerDeathEvent(_duration) {
	objPlayerDeath.duration = _duration;
}

function playerGetSwordEvent(_duration) {
	objGetSword.duration = _duration;
}
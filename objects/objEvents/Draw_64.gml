// Vignette de focus
if (global.status == "c") {
	// Focus Vignette
	with (objCamFocus) {
		if (objFocus != noone or focus != [-1, -1]) {
			draw_set_color(c_black);
			draw_rectangle(0, 0, 320, 40 * other.focusVignette, 0);
			draw_rectangle(0, 320 - (40 * other.focusVignette), 320, 320, 0);
			
			// Aumentar foco
			other.focusVignette = min(other.focusVignette + other.focusVignetteSpeed, 1);
		} else {
			other.focusVignette = min(other.focusVignette - other.focusVignetteSpeed, 1);
		}
	}
}



// Debug
if (global.debug) {
	draw_set_color(c_white);
	draw_text(2, 2, objPlayer.targetX);
	draw_text(2, 12, objPlayer.targetY);
	draw_text(22, 2, objPlayer.x);
	draw_text(22, 12, objPlayer.y);
	draw_text(2, 22, objPlayer.state);
	draw_text(2, 32, objPlayer.attackDuration);
	draw_text(2, 42, "Atacando: " +string(objPlayer.attacking));
	draw_text(2, 52, "Movendo: " +string(objPlayer.moving));
	draw_text(2, 62, "Moves: " +string(objPlayer.moves));
	draw_text(2, 72, "Turno: " +string(global.turn));
}
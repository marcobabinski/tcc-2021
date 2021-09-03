keyRight = keyboard_check_pressed(vk_right);
keyUp = keyboard_check_pressed(vk_up);
keyLeft = keyboard_check_pressed(vk_left);
keyDown = keyboard_check_pressed(vk_down);

if (global.status == "g") {
	if (global.turn == "p") {
		script_execute(state);
	}
}
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check(vk_up);
keyLeft = keyboard_check(vk_left);
keyDown = keyboard_check(vk_down);

if (global.status == "g") {
	if (global.turn == "p") {
		//if (not moving or not attacking) {
			script_execute(state);
		//}
	}
}

// Atualizar sprite
depth = -bbox_bottom;
image_index = facing;
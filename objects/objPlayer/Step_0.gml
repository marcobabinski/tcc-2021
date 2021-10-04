keyRight = keyboard_check(vk_right) or gamepad_button_check(0, gp_padr);
keyUp = keyboard_check(vk_up) or gamepad_button_check(0, gp_padu);
keyLeft = keyboard_check(vk_left) or gamepad_button_check(0, gp_padl);
keyDown = keyboard_check(vk_down) or gamepad_button_check(0, gp_padd);

// Movimentação com analogico
if (gamepad_axis_value(0, gp_axislh) > 0.2) keyRight = true;
if (gamepad_axis_value(0, gp_axislh) < -0.2) keyLeft = true;
if (gamepad_axis_value(0, gp_axislv) > 0.2) keyDown = true;
if (gamepad_axis_value(0, gp_axislv) < -0.2) keyUp = true;

if (global.status == "g") {
	if (global.turn == "p") {
		//if (not moving or not attacking) {
			script_execute(state);
		//}
	}
}

// Atualizar sprite
depth = -bbox_bottom;

if (state != playerStateTeleporting and state != playerStateNextLevel) image_index = facing;
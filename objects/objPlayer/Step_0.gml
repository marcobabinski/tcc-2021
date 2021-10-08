keyRight = keyboard_check(vk_right) or keyboard_check(ord("D")) or gamepad_button_check(0, gp_padr);
keyUp = keyboard_check(vk_up) or keyboard_check(ord("W")) or gamepad_button_check(0, gp_padu);
keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A")) or gamepad_button_check(0, gp_padl);
keyDown = keyboard_check(vk_down) or keyboard_check(ord("S")) or gamepad_button_check(0, gp_padd);

// Movimentação com analogico
if (gamepad_axis_value(0, gp_axislh) > 0.2) keyRight = true;
if (gamepad_axis_value(0, gp_axislh) < -0.2) keyLeft = true;
if (gamepad_axis_value(0, gp_axislv) > 0.2) keyDown = true;
if (gamepad_axis_value(0, gp_axislv) < -0.2) keyUp = true;

if (global.status == "g") {
	if (global.turn == "p") {
		script_execute(state);
	}
}

// Atualizar sprite
depth = -bbox_bottom;

if (state == playerStateFree or state == playerStateMoving or state == playerStateAttacking) image_index = facing;
keyUp = keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0, gp_padu);
keyDown = keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0, gp_padd);
keyLeft = keyboard_check_pressed(vk_left) or gamepad_button_check_pressed(0, gp_padl);
keyRight = keyboard_check_pressed(vk_right) or gamepad_button_check_pressed(0, gp_padr);

keyConfirm = keyboard_check_pressed(vk_enter)
or keyboard_check_pressed(vk_space)
or keyboard_check_pressed(ord("Z"))
or gamepad_button_check_pressed(0, gp_face1);

keyCancel = keyboard_check_pressed(vk_escape)
or keyboard_check_pressed(vk_backspace)
or keyboard_check_pressed(ord("X"))
or gamepad_button_check_pressed(0, gp_face2)
or gamepad_button_check_pressed(0, gp_face4);

keyCall = keyboard_check_pressed(vk_escape)
or keyboard_check_pressed(ord("M"))
or gamepad_button_check_pressed(0, gp_start)
or gamepad_button_check_pressed(0, gp_face2);

keyFullscreen = keyboard_check_pressed(vk_f11);

// Alternar estado de fullscreen
if (keyFullscreen) global.fullscreen = !global.fullscreen;

// Ações menu in-game
if (menu == 0) {
	// Ações tela inicial
	if (ig_screen == 0) {
		// Fechar menu
		if (keyCancel or gamepad_button_check_pressed(0, gp_start)) menu = -1;
	}
}

// Chama o menu in-game
if (keyCall and global.turn == "p" and global.status == "g" and menu == -1) {
	// Define o menu in-game
	menu = 0;
	// Reseta o posicionador e a tela
	ig_pos = 0;
	ig_screen = 0;
}

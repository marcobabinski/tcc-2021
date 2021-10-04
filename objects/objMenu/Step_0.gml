keyCall = keyboard_check_pressed(vk_escape)
or keyboard_check_pressed(ord("M"));

keyFullscreen = keyboard_check_pressed(vk_f11);

// Alternar estado de fullscreen
if (keyFullscreen) global.fullscreen = !global.fullscreen;

// Chama o menu in-game
if (keyCall and global.turn == "p" and global.status == "g" and menu == -1) {
	// Define o menu in-game
	menu = 0;
	// Reseta o posicionador e a tela
	ig_pos = 0;
	ig_screen = 0;
}

if (menu > -1) {
	keyUp = keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(vk_down);
	keyLeft = keyboard_check_pressed(vk_left);
	keyRight = keyboard_check_pressed(vk_right);

	keyConfirm = keyboard_check_pressed(vk_enter)
	or keyboard_check_pressed(vk_space)
	or keyboard_check_pressed(ord("Z"));

	keyCancel = keyboard_check_pressed(vk_escape)
	or keyboard_check_pressed(vk_backspace)
	or keyboard_check_pressed(ord("X"));
}

// Ações menu in-game
if (menu == 0) {
	// Ações tela inicial
	if (ig_screen == 0) {
		// Fechar menu
		if (keyCancel) menu = -1;
	}
}

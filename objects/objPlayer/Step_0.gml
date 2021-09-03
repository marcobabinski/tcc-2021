if (moves > 0 and not reached) {
	script_execute(ai);
	moves--;
}

if (not reached) {
	if (tilemap_get(global.tilemap, x div 16, y div 16)) == 2 {
		show_message("DESTINO ALCANÇADO!");
		reached = true;
	}
}

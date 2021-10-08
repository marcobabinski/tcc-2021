// Autodestruição
if (global.turn != "p") instance_destroy(self);

if (abs(getPosTile(self)[0] - getPosTile(objPlayer)[0]) == 1
and abs(getPosTile(self)[1] - getPosTile(objPlayer)[1] != 0)) {
	//show_message("Estou em: " +string(getPosTile(self)) +" e me matei :(");
	instance_destroy(self);
}

if (abs(getPosTile(self)[0] - getPosTile(objPlayer)[0]) != 0
and abs(getPosTile(self)[1] - getPosTile(objPlayer)[1] == 1)) {
	//show_message("Estou em: " +string(getPosTile(self)) +" e me matei :(");
	instance_destroy(self);
}

if (abs(getPosTile(self)[0] - getPosTile(objPlayer)[0]) > 1) instance_destroy(self);
if (abs(getPosTile(self)[1] - getPosTile(objPlayer)[1]) > 1) instance_destroy(self);

if (objPlayerDeath.active or objNextLevel.active) instance_destroy(self);

// Tiles indevidos
if (tileAt(getPosTile(self)[0], getPosTile(self)[1]) != FLOOR) instance_destroy(self);

// Tirar de cima de inimigos
with (all) {
	// Inimigos
	if (depth == layer_get_depth(layer_get_id("Enemies"))) {
		if(getPosTile(self)[0] == getPosTile(other)[0]
		and getPosTile(self)[1] == getPosTile(other)[1]) instance_destroy(other);
	} else if (depth == layer_get_depth(layer_get_id("Terrain"))) { // Terrenos
		if (object_index == objJar
		 or object_index == objWall
		 or object_index == objGoal) {
			if(getPosTile(self)[0] == getPosTile(other)[0]
			and getPosTile(self)[1] == getPosTile(other)[1]) instance_destroy(other);
		 }
	}
}

// Quando player se move ou ataca
if (objPlayer.moving or objPlayer.attacking) instance_destroy(self);

// Animação de Surgimento
if (objGame.warningDelay < 1) image_alpha = 1 - (objGame.warningCountdown / 15);
depth = -bbox_bottom;
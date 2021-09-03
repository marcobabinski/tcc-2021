/// @description
// Randomiza a seed
randomize();

// Pega a tilemap
global.tilemap = layer_tilemap_get_id(layer_get_id("Elements"));

// Cria um array 2d contendo todos os tiles
for(var i = 0; i < tilemap_get_height(global.tilemap); i++) { 
	for(var j = 0; j < tilemap_get_width(global.tilemap); j++) {
		global.collisionField[i][j] = tilemap_get(global.tilemap, i, j);
	}
}

// Itera pelo tilemap e substitui os tiles de inimigos pelos respectivos
for(var i = 0; i < tilemap_get_height(global.tilemap); i++) {
	for(var j = 0; j < tilemap_get_width(global.tilemap); j++) {
		if (tilemap_get(global.tilemap, i, j) > 10) {
			switch (tilemap_get(global.tilemap, i, j)) {
				case SLIME:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Enemies"), objSpike);
					global.collisionField[i][j] = FLOOR;
					break;
				case SKULL:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, "Enemies", objSkull);
					global.collisionField[i][j] = FLOOR;
					break;
				case SPIKES:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, "Enemies", objSpike);
					global.collisionField[i][j] = FLOOR;
					break;
			}
		}
	}
}

var _tile = [0, 1, 2];

array_delete(_tile, 1, 1)

//show_message(_tile);
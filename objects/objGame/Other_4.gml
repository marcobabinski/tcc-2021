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
		if (tilemap_get(global.tilemap, i, j) > 0) {
			switch (tilemap_get(global.tilemap, i, j)) {
				case SLIME:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Enemies"), objSlime);
					global.collisionField[i][j] = FLOOR;
					break;
				case SKULL:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Enemies"), objSkull);
					global.collisionField[i][j] = FLOOR;
					break;
				case SPIKES:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Terrain"), objSpike);
					global.collisionField[i][j] = FLOOR;
					break;
				case GOAL:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Terrain"), objGoal);
					global.collisionField[i][j] = GOAL;
					break;
				case JAR:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Terrain"), objJar);
					global.collisionField[i][j] = OBSTACLE;
					break;
				case BUTTON:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Terrain"), objButton);
					global.collisionField[i][j] = FLOOR;
					break;
				case DOOR:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Terrain"), objDoor);
					global.collisionField[i][j] = OBSTACLE;
					break;
				case LASER:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Terrain"), objLaser);
					global.collisionField[i][j] = FLOOR;
					break;
				case WALL:
					tilemap_set(global.tilemap, 1, i, j);
					instance_create_layer(i * 16, j * 16, layer_get_id("Terrain"), objWall);
					global.collisionField[i][j] = OBSTACLE;
					break;
				case PLAYERONLY:
					global.collisionField[i][j] = PLAYERONLY;
					break;
			}
		}
	}
}

// Summonar Player
if (not instance_exists(objPlayer)) {
	instance_create_layer(0, 0, "Player", objPlayer);
}

// Reposicionar Player
if (global.checkpoint == -1) {
	objPlayer.x = levelStart[global.level][0] * 16
	objPlayer.y = levelStart[global.level][1] * 16
} else {
	with objCheckpoint {
		if (global.checkpoint == checkpointId) {
			objPlayer.x = getPosTile(self)[0] * 16
			objPlayer.y = getPosTile(self)[1] * 16
		}
	}
}

// Setar camera
objCamera.x = objPlayer.x - SCREEN_WIDTH;
objCamera.y = objPlayer.y - SCREEN_HEIGHT;


// Setar os "Playeronly"
var poList = [objTeleporter, objGoal, objCheckpoint];
for (var i = 0; i < array_length(poList); i++) {
	with (poList[i]) {
		tilemap_set(global.tilemap, PLAYERONLY, getPosTile(self)[0], getPosTile(self)[1]);
		global.collisionField[getPosTile(self)[0]][getPosTile(self)[1]] = PLAYERONLY;
	}
}

// Lockar na ultima fase
if (global.level == 10) {
	global.turn = "endgame";
}

// Intro Management
if (global.intro > 0 and global.level == 0 and room == LevelTutorial) {
	instance_create_layer(0, 0, "Cutscene", objSplashScreen);
	global.intro--;
}
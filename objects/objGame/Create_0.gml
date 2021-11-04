global.collisionField = [];
global.tilemap = 0;
global.status = "g";
global.turn = "p";
global.level = 0;
global.checkpoint = -1;
global.cutsceneTime = 0;
global.debug = false;
global.sword = false;

// Pontuação
global.score = 0;
global.levelScore = 0;
global.pointStreak = 0;

// Configs
global.musicVolume = 0.5;
global.soundVolume = 0.5;
global.fullscreen = false;

levels = [LevelTutorial, Level11, Level12, Level13, Level21, Level22, Level23, Level31, Level32, Level33, RoomComplete];
levelStart = [[23, 38], [23, 39], [34, 32], [22,36], [22,36], [22,36], [22,36], [22,36], [28,10], [22,36], [0, 0]];
levelTitle = ["Tutorial",
			  "Level 1-1", "Level 1-2", "Level 1-3",
			  "Level 2-1", "Level 2-2", "Level 2-3",
			  "Level 3-1", "Level 3-2", "Level 3-3",
			  "Fim de Jogo!!!"];
levelLabel = ["0-0",
			  "1-1", "1-2", "1-3",
			  "2-1", "2-2", "2-3",
			  "3-1", "3-2", "3-3",]
			  
levelPass = [[0,0,0],
			 [1,0,2], [2,1,0], [1,2,4],
			 [4,5,1], [5,0,0], [3,4,1],
			 [2,2,5], [4,1,4], [3,5,0]];

warningDelay = 90;
warningCountdown = warningDelay + 15;

var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);
global.collisionField = [];
global.tilemap = 0;
global.status = "g";
global.turn = "p";
global.level = 0;
global.checkpoint = -1;
global.cutsceneTime = 0;
global.debug = true;

levels = [LevelTutorial, Level11, Level12, Level13];
levelStart = [[23, 38], [2, 3], [14, 3], [5, 1]];

warningDelay = 90;
warningCountdown = warningDelay + 15;

var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);
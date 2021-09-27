var _x = getPosTile(self)[0];
var _y = getPosTile(self)[1];
var _behind = false;

//if (getPosTile(objPlayer)[0] == _x
//and getPosTile(objPlayer)[1] == _y - 1) _behind = true;

if (objPlayer.x >= x and objPlayer.x < x + 16
and objPlayer.y <= y and objPlayer.y >= y - 16) _behind = true;

if (_behind) image_alpha = max(0.4, image_alpha - 0.05);
else image_alpha = min(1, image_alpha + 0.05);

depth = -bbox_bottom;
var _x = getPosTile(self)[0];
var _y = getPosTile(self)[1];
var _behind = false;

//if (getPosTile(objPlayer)[0] == _x
//and getPosTile(objPlayer)[1] == _y - 1) _behind = true;

if (alphaChange) {
	// Player ta atras?
	if (objPlayer.x >= x and objPlayer.x < x + 16
	and objPlayer.y <= y and objPlayer.y >= y - 16) _behind = true;

	// Inimigo tá atras?
	with objSlime {
		if (self.x >= other.x and self.x < other.x + 16
		and self.y <= other.y and self.y >= other.y - 16) _behind = true;
	}

	with objSkull {
		if (self.x >= other.x and self.x < other.x + 16
		and self.y <= other.y and self.y >= other.y - 16) _behind = true;
	}

	with objWarningTile {
		if (self.x >= other.x and self.x < other.x + 16
		and self.y <= other.y and self.y >= other.y - 16) _behind = true;
	}

	if (_behind) image_alpha = max(0.4, image_alpha - 0.05);
	else image_alpha = min(1, image_alpha + 0.05);
}

depth = -bbox_bottom;
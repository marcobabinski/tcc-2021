depth = 650;
y += yspd;

// Gravity
yspd += grv;

if(yspd >= 1) {
	grv = 0;
	yspd = 0;
	image_speed = 1;
}

// Pegar
if (pos[0] == getPosTile(objPlayer)[0]
and pos[1] == getPosTile(objPlayer)[1]) {
	addPointsNoBonus(2500, x, y);
	playCollectRupee();
	instance_destroy(self);
}
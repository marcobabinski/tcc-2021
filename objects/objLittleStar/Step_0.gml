if (xspd > 0) {
	x += xspd;
	xspd = max(0, xspd - 0.04);
} else {
	image_alpha -= 0.03;
}

image_angle += 5;

if (image_alpha < 0) instance_destroy(self);
if (done) {
	x += xspd;
	y += yspd;
	duration--;
}

if (duration < 0) image_alpha -= 0.05;
if (image_alpha < 0) instance_destroy(self);
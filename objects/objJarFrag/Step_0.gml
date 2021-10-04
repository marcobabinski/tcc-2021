x += spdx;
y += spdy;

spdx = spdx;
spdy += 0.05;

if (droptime < 0) {
	spdy = 0;
	spdx = 0;
	disappeartime--;
}

if (disappeartime < 40) {
	image_alpha = disappeartime % 4;
}

if (disappeartime < 0) instance_destroy(self);

droptime--;

depth = -bbox_bottom;
// Aumentar Timer
timer++;

// Sprite
if (attacking) {
	sprite_index = sprSlash
	image_speed = 1;
} else {
	sprite_index = sprSword;
	image_index = 0;
	image_speed = 0;
}

// Floating
y += sin(timer * floatFrequency) * floatAmplitude;

// Aplicar
draw_self();
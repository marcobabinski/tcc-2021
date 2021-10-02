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

// Ocultar em animações
if (objPlayer.state == playerStateTeleporting
or objPlayer.state == playerStateNextLevel) {
	image_alpha = max(0, image_alpha - 0.1);
} else image_alpha = min(1, image_alpha + 0.1);

// Aplicar
draw_self();
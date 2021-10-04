// Aumentar Timer
timer++;

// Floating
//y += sin(timer * floatFrequency) * floatAmplitude;

// Sombra
draw_sprite_ext(sprShadow, 0, x + 7.5, y + 16, 0.7 + (sin(timer * floatFrequency) * floatAmplitude/3), 0.7 + (sin(timer * floatFrequency) * floatAmplitude/3), 0, c_white, 0.25);

// Aplicar
draw_sprite(sprLosangolano, image_index, x, y + sin(timer * floatFrequency) * floatAmplitude);
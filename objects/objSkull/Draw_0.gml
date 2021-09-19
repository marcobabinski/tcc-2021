// Aumentar Timer
timer++;

// Floating
//y += sin(timer * floatFrequency) * floatAmplitude;

// Aplicar
draw_sprite(sprLosangolano, image_index, x, y + sin(timer * floatFrequency) * floatAmplitude);
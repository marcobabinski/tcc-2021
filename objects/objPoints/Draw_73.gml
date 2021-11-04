draw_set_font(fonHeartbit2);
draw_set_alpha(opacity);

depth = bbox_bottom;

// Outline
draw_set_color(c_black);
draw_text(x + 1, y, points);
draw_text(x - 1, y, points);
draw_text(x, y + 1, points);
draw_text(x, y - 1, points);

draw_set_color(c_white);
draw_text(x, y, points);

draw_set_alpha(1);

y -= 0.5;
opacity -= 0.05;
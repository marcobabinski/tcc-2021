opacity -= 0.05;
draw_set_color(c_orange);
draw_set_alpha(opacity);
draw_rectangle(x, y, x, y, false);

// Resetar opacidade
draw_set_alpha(1);
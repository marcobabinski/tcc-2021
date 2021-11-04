// Label
draw_set_color(make_color_rgb(51, 60, 87));
draw_rectangle(0, 0, 50, 16, false);
draw_triangle(50, -1, 55, -1, 50, 16, false);

// Texto
draw_set_font(fonFutilePro);
draw_set_color(c_black);
draw_text(25 - labelSize/2 - 1, 1, labelText);
draw_set_color(c_white);
draw_text(25 - labelSize/2, 0, labelText);

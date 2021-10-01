if (levelTitle != "") {
	levelH = min(10, levelH + 1);
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 90 - levelH, 320, 90 + levelH, false);
	
	levelX += ((SCREEN_WIDTH/2 - string_width(levelTitle)) - levelX)/30;
	
	draw_set_font(fonFutilePro);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(levelX, 82, levelTitle)
} else {
	levelX = string_width(levelTitle) * -1;
	levelH = max(0, levelH - 1);
}
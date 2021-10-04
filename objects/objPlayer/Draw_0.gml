movingStretch();

// Sombra
if (state == playerStateFree
 or state == playerStateMoving
 or state == playerStateAttacking)
draw_sprite_ext(sprShadow, 0, x + 8, y + 12, 1, 1, 0, c_white, 0.25);

draw_self();
state = playerStateFree;
kill = playerDeath;
moves = 1;
moving = false;
attacking = false;

targetX = x;
targetY = y;

// Animação
facing = 0;
attackDuration = 0;

// Criar espada
if (not instance_exists(objSword)) instance_create_layer(x, y, "Player", objSword);
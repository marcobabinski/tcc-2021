moves = 0;
reached = false;
ai = aiAStar;
kill = losangleKill;

targetX = x;
targetY = y;

// Floating
// Animação
timer = 0;

anchorY = 100;
floatFrequency = 0.1;
floatAmplitude = 0.3;

// Disabled
if (buttonDisable[0] == -1 and buttonDisable[1] == -1) inactive = false;
else inactive = true;
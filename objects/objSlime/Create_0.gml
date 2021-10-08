moves = 0;
charged = false;
summoned = !hiddenSummon;
ai = aiAStar;
kill = slimeKill;

targetX = x;
targetY = y;

// Charging animations
timer = 0;
chargeShake = 0;

// Disabled
if (buttonDisable[0] == -1 and buttonDisable[1] == -1) inactive = false;
else inactive = true;
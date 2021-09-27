if (moveDelay < 1) {
	if (round(x) != targetX or round(y) != targetY) {
		x += (targetX - x)/moveSpeed;
		y += (targetY - y)/moveSpeed;
	} else {
		x = round(x);			
		y = round(y);
		instance_destroy(self);	
	}
}

moveDelay = max(0, moveDelay - 1);
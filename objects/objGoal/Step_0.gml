/// @description
if (getPosTile(self)[0] == getPosTile(objPlayer)[0]
	and getPosTile(self)[1] == getPosTile(objPlayer)[1]) {
	show_message(global.level);
	global.level++;
	show_message(global.level);
}
// Verificar se player pisou
if (hasSword) {
	if ((getPosTile(objPlayer)[0] == getPosTile(self)[0])
	and (getPosTile(objPlayer)[1] == getPosTile(self)[1])) {
		hasSword = false;
		global.sword = true;
		image_index = 1;
	}
}



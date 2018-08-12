if x < obj_player.end_pos{
	scr_fall()
}
if collected{
	image_xscale = .95*image_xscale
	image_yscale = .95*image_yscale
}
if!global.menu{
	image_speed = 1
}else{
	image_speed = 0
}
if !global.inside&&global.play{
	draw_self()
	if coin!= -1{
		draw_sprite_ext(spr_box_coin,0,x+32,y+32,1,1,coin,c_white,1)
	}
}
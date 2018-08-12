if !broken{
	draw_set_color(c_black)
	draw_rectangle(-100,-100,1500,1500,false)
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_dkgray,1)
}else{
	if !global.inside&&global.play{
		draw_self()
		draw_set_alpha(alpha)
		draw_set_color(c_black)
		draw_rectangle(-100,-100,1500,1500,false)
		draw_set_alpha(1)
	}
	alpha-=.02
	if image_index!=0{
		draw_sprite(spr_box_break,0,x,y)
	}
}
image_index = image




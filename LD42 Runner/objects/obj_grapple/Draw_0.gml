if vis{
draw_self()
draw_set_color(c_maroon)
draw_line_width(x+lengthdir_x(3,180+image_angle),y+lengthdir_y(3,180+image_angle),obj_player.x,obj_player.y,.5)
}


if fade>0{
	draw_sprite_ext(sprite_index,0,fade_x,fade_y+((1-fade)*40),1,1,fade_angle,c_gray,fade)
	draw_set_alpha(fade)
	draw_line_width(fade_x+lengthdir_x(3,180+fade_angle),fade_y+((1-fade)*40)+lengthdir_y(3,180+fade_angle),obj_player.x,obj_player.y,.5)
	draw_set_alpha(1)
	if fade=1{
		scr_snd_rip()
	}
	if!global.menu{
		fade-=.05
	}
}
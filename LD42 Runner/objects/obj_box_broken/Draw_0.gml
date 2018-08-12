if image_index = 0{
	draw_set_color(c_black)
	//draw_rectangle(x-500,y-500,x+500,y+500,false)
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1)
}else{
	if !global.inside&&global.play{
		draw_self()
		if coin!= -1{
			draw_sprite_ext(spr_box_coin,0,x+32,y+32,1,1,coin,c_white,1)
		}
		draw_set_alpha(alpha)
		draw_set_color(c_black)
		//draw_rectangle(x-500,y-500,x+500,y+500,false)
		draw_set_alpha(1)
	}
	alpha-=.02
}
image_index = image

if image_index!=0{
	if broke_l{
		draw_sprite(spr_box_break,3,x,y)
	}
	if broke_r{
		draw_sprite(spr_box_break,1,x,y)
	}
	if broke_u{
		draw_sprite(spr_box_break,0,x,y)
	}
	if broke_d{
		draw_sprite(spr_box_break,2,x,y)
	}
}

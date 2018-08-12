draw_sprite_ext(spr_player,0,x,y,1,1,angle,c_white,1)
if !global.menu&&!global.shop{
	draw_sprite_ext(spr_player_2,0,x,y,1,1,point_direction(x,y,mouse_x,mouse_y),c_white,1)
	prev_mouse_angle = point_direction(x,y,mouse_x,mouse_y)
}else{
	draw_sprite_ext(spr_player_2,0,x,y,1,1,prev_mouse_angle,c_white,1)
}

//draw_set_color(c_red)
//draw_circle(grapple_x,grapple_y,3,false)
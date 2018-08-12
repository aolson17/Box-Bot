if global.dead{
	draw_set_color(c_black)
	draw_set_alpha(alpha_dead)
	draw_rectangle(x-500,y-500,x+500,y+500,false)
	draw_set_alpha(1)
	alpha_dead+=.05
	clamp(alpha_dead,0,100)
}
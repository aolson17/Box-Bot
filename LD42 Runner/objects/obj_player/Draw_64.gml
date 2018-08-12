/*if point_distance(x+cur_x,y+cur_y,grapple_x,grapple_y)>length&&grapple = true{
	draw_text(10,30,point_distance(x+cur_x,y+cur_y,grapple_x,grapple_y))
	draw_text(10,45,"Using Grapple Code")
	
}

draw_text(10,70,"cur_x: "+string(cur_x))
draw_text(10,85,"cur_y: "+string(cur_y))

draw_text(10,100,"Magnitude: "+string(magnitude))
draw_text(10,115,"Direction(°): "+string(dir))

draw_text(10,130,"x: "+string(x))
draw_text(10,145,"y: "+string(y))

draw_text(10,200,"FPS: "+string(fps_real))

//draw_text(10,240,"Dif: "+string(point_direction(x,y,grapple_x,grapple_y)-prev_grapple_angle))
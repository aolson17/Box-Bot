

if!global.menu{


if obj_player.grapple = 0{
	vsp+=.1
}else{
	cur_x = 0
	cur_y = 0
	hsp = 0
	vsp = 0
	if x < obj_player.end_pos{
		obj_player.shooting = false
		obj_player.grapple = 0
		if !faded{
			fade=1
			fade_x = x
			fade_y = y
			fade_angle = image_angle
			faded = true
		}
	}
}

cur_x+=hsp
cur_y+=vsp

if obj_player.shooting{
	if point_distance(x,y,obj_player.x,obj_player.y)>obj_player.range{
		obj_player.shooting = false
		obj_player.grapple = 0
		if !faded{
			fade=1
			fade_x = x
			fade_y = y
			fade_angle = image_angle
			faded = true
		}
	}
}



var collision = false
col_id = instance_place(x+cur_x,y+cur_y,par_wall)
if col_id != noone &&obj_player.shooting=true{
	collision = true
}
col_id = collision_line(x,y,x+cur_x,y+cur_y,par_wall,true,true)
if col_id != noone&&obj_player.shooting=true{
	collision = true
}
if collision{
	if instance_number(col_id)>0{
		if col_id.object_index = obj_start_box_wall_top{
			with(col_id){
				obj_start_box.broken = true
				instance_destroy()
				global.play = true
				global.inside = false
			}
			alarm[0]=5
		}
	}
	obj_player.grapple = 1
	obj_player.shooting = 0
	obj_player.grapple_x = x//+cur_x
	obj_player.grapple_y = y//+cur_y
	obj_player.length = point_distance(x,y,obj_player.x,obj_player.y)
	if instance_number(col_id)>0{
		if col_id.object_index = obj_belt||col_id.object_index = obj_wall||col_id.object_index = obj_end{
			obj_player.shooting = false
			obj_player.grapple = 0
			if !faded{
				fade=1
				fade_x = x
				fade_y = y
				fade_angle = image_angle
				faded = true
			}
		}
	}
	if x < obj_player.end_pos{
		obj_player.shooting = false
		obj_player.grapple = 0
		if !faded{
			fade=1
			fade_x = x
			fade_y = y
			fade_angle = image_angle
			faded = true
		}
	}
}else{
	if cur_x!=0||cur_y!=0{
		image_angle = point_direction(x,y,x+cur_x,y+cur_y)
	}
}




x+= cur_x
y+= cur_y
hsp = 0
vsp = 0

if obj_player.grapple = 1||obj_player.shooting{
	vis = true
}else{
	vis = false
}


}
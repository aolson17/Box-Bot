if !global.menu&&!global.shop{
//Variables
if powerup = "grav"{
	grav = .1
	fallspeed = 4
}else{
	grav = .2
	fallspeed = 20
}
if powerup = "jump"{
	jumpspeed = 8+(obj_menu.upgrade_jump*.05)*obj_menu.upgrade_toggle_jump
}else if powerup = "bad jump"{
	jumpspeed = 4+(obj_menu.upgrade_jump*.01)*obj_menu.upgrade_toggle_jump
}else{
	jumpspeed = 5.3+(obj_menu.upgrade_jump*.05)*obj_menu.upgrade_toggle_jump
}
if powerup = "break"{
	break_speed = 0
}else if powerup = "bad box"{
	break_speed = 10+(obj_menu.upgrade_break_speed*-.05)*obj_menu.upgrade_toggle_break_speed
}else{
	break_speed = 6+(obj_menu.upgrade_break_speed*-.05)*obj_menu.upgrade_toggle_break_speed
}
if powerup = "range"{
	range = 500+(obj_menu.upgrade_range*2)*obj_menu.upgrade_toggle_range
}else{
	range = 150+(obj_menu.upgrade_range*2)*obj_menu.upgrade_toggle_range
}

wallJumpX = 3+(obj_menu.upgrade_wall_jump*.05)*obj_menu.upgrade_toggle_wall_jump
wallJumpY = 4.5+(obj_menu.upgrade_wall_jump*.05)*obj_menu.upgrade_toggle_wall_jump

walkspeed = 3+(obj_menu.upgrade_speed*.02)*obj_menu.upgrade_toggle_speed
sprintspeed = 6+(obj_menu.upgrade_speed*.05)*obj_menu.upgrade_toggle_speed

if powerup!="none"{
	if end_pos%60=0{
		pow_time-=1
	}
	if pow_time <= 0{
		powerup="none"
	}
}


movespeed = walkspeed*!keyboard_check(vk_shift)*!keyboard_check(vk_control) + sprintspeed*keyboard_check(vk_shift) + slowSpeed*!keyboard_check(vk_shift)*keyboard_check(vk_control)

//Movement
key_right = keyboard_check(ord("D"));
key_left = -keyboard_check(ord("A"));
key_jump = keyboard_check(vk_space);

move = key_left + key_right;
hsp = move * movespeed*acceleration;

if place_meeting(x,y+1,obj_belt){// Conveyor Belts
	//if cur_x>-2{cur_x-=2}
	//x-=2
	//cur_x -= 2
}

if (cur_y < fallspeed)cur_y += grav ;//Apply Gravity

if (place_meeting(x,y+1,par_wall)||place_meeting(x,y-1,par_wall)){
    if place_meeting(x,y-1,par_wall){// stop jump at ceiling
        jump = 0
    }
    if place_meeting(x,y+1,par_wall)&&cur_y >0{
        cur_y = 0
		y = round(y)
		if place_meeting(x,y,par_wall){
			y--
		}
    }
    if place_meeting(x,y-1,par_wall)&&cur_y <0{
        cur_y = 0
    }
}

//Set Jump State
vsp = 0
if key_jump&&jump_ready{
	jump_ready = false
    if place_meeting(x,y+1,par_wall){
        jump = 1
        vsp = key_jump * -jumpspeed
		scr_snd_jump()
    }else{
		if grapple&&length<20{
			vsp = key_jump * -jumpspeed/2
			
			prev_grapple_angle = point_direction(x,y,grapple_x,grapple_y)
			grapple = 0
			shooting = false
			if !obj_grapple.faded{
				obj_grapple.fade = 1
				obj_grapple.fade_x = obj_grapple.x
				obj_grapple.fade_y = obj_grapple.y
				obj_grapple.fade_angle = obj_grapple.image_angle
				obj_grapple.faded = true
			}
		}
	}
}else if !key_jump{
	jump_ready = true
}

//Manage Jump
if jump = 1{
    if cur_y > 0{//if falling
        jump = 0
    }else if !key_jump{
        cur_y *= jumpstoprate
        jump = 0
    }
}

if cur_y < -jumpspeed {// Limit jump speed
    cur_y = -jumpspeed
}

cur_y += vsp// apply jump

if cur_y>0&&move!=0{// wall slide
    if collision_point(x+1+sprite_width/2,y+sprite_height/2,par_wall,true,true)&&collision_point(x+1+sprite_width/2,y-sprite_height/2,par_wall,true,true){// wall slide right
        cur_y=clamp(cur_y,-100,wallspeed)
        //scr_particleWallSlide_right()
        angle+=cur_y
        // wall jump
        if keyboard_check_pressed(vk_space){
			scr_snd_jump()
            cur_x -= wallJumpX
            cur_y -= wallJumpY
        }
    }
    if collision_point(x-1-sprite_width/2,y+sprite_height/2,par_wall,true,true)&&collision_point(x-1-sprite_width/2,y-sprite_height/2,par_wall,true,true){// wall slide left
        cur_y=clamp(cur_y,100,wallspeed)
        //scr_particleWallSlide_left()
        angle-=cur_y
        // wall jump
        if keyboard_check_pressed(vk_space){
			scr_snd_jump()
            cur_x += wallJumpX
            cur_y -= wallJumpY
        }
    }
}

/*if hsp > 0{//limit speed right
    if cur_x+hsp <= movespeed{
        cur_x += (place_meeting(x,y+1,par_wall))*hsp +((1-place_meeting(x,y+1,par_wall))*airMovePercent*hsp)
    }
}else if hsp < 0{// limit speed left
    if cur_x+hsp >= -movespeed{
        cur_x += (place_meeting(x,y+1,par_wall))*hsp +((1-place_meeting(x,y+1,par_wall))*airMovePercent*hsp)
    }
}*/
if cur_x+hsp <= movespeed && cur_x+hsp >= -movespeed{// Limit run speed
    cur_x += (place_meeting(x,y+1,par_wall))*hsp +((1-place_meeting(x,y+1,par_wall))*airMovePercent*hsp)
}else if cur_x <= movespeed+(movespeed*acceleration) && cur_x >= -movespeed-(movespeed*acceleration){
    if cur_x > 0{
        cur_x+= abs(movespeed-abs(cur_x))
    }else if cur_x < 0{
        cur_x-= abs(movespeed-abs(cur_x))
    }
}
if (place_meeting(x,y+1,par_wall)){//apply friction
    angle-=cur_x*1.4
    if cur_x > 0 && move<=0{
        cur_x -= cur_x*xfriction
    }else if cur_x < 0 && move>=0{
        cur_x -= cur_x*xfriction
    }
    if cur_x <= 1 && cur_x >= -1 && cur_x != 0 && move = 0{cur_x = 0}
}else{// apply air resistance
	angle-=cur_x*.8
    if cur_x > 0 && move<=0{
        cur_x -= airResistance
    }else if cur_x < 0 && move>=0{
        cur_x += airResistance
    }
    if cur_x <= .3 && cur_x >= -.3 && cur_x != 0 && move = 0{cur_x = 0}
}

if grapple{
	angle += ceil(point_direction(x,y,grapple_x,grapple_y)-prev_grapple_angle)
	prev_grapple_angle = point_direction(x,y,grapple_x,grapple_y)
	if keyboard_check(ord("W")){
		length-=2
		if length<0{length=0}
	}
	if keyboard_check(ord("S")){
		length+=2
		if length>range{length=range}
	}
}
magnitude = sqrt(sqr(cur_x)+sqr(cur_y))
dir = point_direction(0,0,cur_x,cur_y)
if point_distance(x+cur_x,y+cur_y,grapple_x,grapple_y)>length&&grapple = true{
	//((cur_y*cur_y)/length)
	
	//var net_force = (cur_y*cur_y)/length
	
	var blue = point_direction(x,y,grapple_x,grapple_y)
	var green = dir
	var red = green - blue
	var purple = 90 - blue
	var a = magnitude*(dsin(red))
	
	new_x = -(a*(dcos(purple)))
	new_y = -(a*(dsin(purple)))
	
	//x = grapple_x+lengthdir_x(floor(length),point_direction(grapple_x,grapple_y,x,y))
	//y = grapple_y+lengthdir_y(floor(length),point_direction(grapple_x,grapple_y,x,y))
	
	cur_x=new_x
	cur_y=new_y
	
	var dis = floor(point_distance(x,y,grapple_x,grapple_y))
	
	if point_distance(x+cur_x,y+cur_y,grapple_x,grapple_y)>length&&grapple = true{
		cur_x+=lengthdir_x(-(length)+dis,blue)
		cur_y+=lengthdir_y(-(length)+dis,blue)
	}
}
dir = point_direction(0,0,cur_x,cur_y)


col_id = instance_place(x+cur_x,y+cur_y,obj_box)
if instance_number(col_id) > 0{
	with(col_id){
		if obj_player.magnitude > other.break_speed{
			
			new = instance_create_layer(x,y,layer,obj_box_broken)
			new.image = image_index
			new.coin = coin
			r = instance_create_layer(x,y,"Instances_2",obj_box_wall_r)
			r.link = new
			l = instance_create_layer(x+64,y+64,"Instances_2",obj_box_wall_l)
			l.link = new
			u = instance_create_layer(x,y,"Instances_2",obj_box_wall_u)
			u.link = new
			d = instance_create_layer(x+64,y,"Instances_2",obj_box_wall_d)
			d.link = new
			if coin!=-1{
				c = instance_create_layer(x+32,y+32,"Instances_1",obj_coin)
				c.link = new
			}
			instance_destroy()
		}
	}
}
if magnitude > break_speed{
col_id = instance_place(x+cur_x,y+cur_y,par_side)//collision_line(x,y,x+cur_x,y+cur_y,par_side,true,true)
	//col_id = collision_line(x,y,x+cur_x,y+cur_y,par_side,true,true)//instance_place(x+cur_x,y+cur_y,par_side)
		if instance_number(col_id) > 0{
			if instance_number(col_id.link) > 0{
				with(col_id){
					switch object_index{
						case obj_box_wall_l:link.broke_l = true
							break
						case obj_box_wall_r:link.broke_r = true
							break
						case obj_box_wall_u:link.broke_u = true
							break
						case obj_box_wall_d:link.broke_d = true
							break
					}
					scr_snd_box()
					instance_destroy()
				}
			}else{
				instance_destroy(col_id)
			}
		}
	//}
}


// Horizontal Collision
if place_meeting(x+cur_x,y,par_wall){
    if move != 0 && place_meeting(x,y+1,par_wall){// Only step up if keys are pressed
        for (var i = 0; i <= stepheight; i += 1){
            if place_meeting(x+cur_x,y-i,par_wall){
                //Pixel Perfect Collision
                if !place_meeting(x+sign(cur_x),y-i,par_wall){
                    if place_meeting(x+sign(cur_x),y-i,par_wall){
                        //move horizontally 1 pixel and up
                        x += sign(cur_x)
                        y -= i
                    }
                }
            }else{
                //move horizontally and up ramp
                //lower speed when walking up step
                cur_x = clamp(cur_x,-movespeed*stepSpeedPercent,movespeed*stepSpeedPercent)
                x += cur_x
                y -= i
                break
            }
        }
    }
    //No vertical movement
    //Pixel Perfect Collision
    for (var i = abs(floor(cur_x)); i > 0; i -= 1){
        if place_meeting(x + sign(cur_x) * i,y,par_wall){
        }else{
            
            x += sign(cur_x) * i
            
            break
        }
    }    
}else{
    //move horizontally
    x += cur_x
}

if place_meeting(x+sign(cur_x),y,par_wall){// set cur_x to 0 if against wall
    cur_x = 0
}

//Vertical Collision
if place_meeting(x,y+cur_y,par_wall){
	if !global.play{
		if instance_place(x,y+cur_y,obj_start_box_wall_top){
			obj_start_box.broken = true
			instance_destroy(instance_place(x,y+cur_y,obj_start_box_wall_top))
			global.play = true
			global.inside = false
		}
	}
	
    //Pixel Perfect Collision
    for (i = abs(floor(cur_y)); i > 0; i -= 1){
        if place_meeting(x,y + sign(cur_y) * i,par_wall){
        }else{
            if (place_meeting(x,y + sign(cur_y) * i,par_wall)){
                if sign(cur_y) < 0{cur_y = 0}
            }
            
            y += sign(cur_y) * i
            break
        }
    }
}else{
    //move vertically
	y+=cur_y
}




if !shooting{
	var menu_x = 10
	var menu_y = display_get_gui_height()*.85
	var sound_x = view_wport[0]*.76
	var sound_y = 30
	var music_x = view_wport[0]*.76
	var music_y = view_hport[0]*.2
	if mouse_check_button_pressed(mb_left){//&&(point_distance(x,y,mouse_x,mouse_y)<60||global.play){
		if global.sound{
			audio_play_sound(snd_shoot,0,0)
		}
		if device_mouse_x_to_gui(0)<menu_x||device_mouse_x_to_gui(0)>menu_x+sprite_get_width(spr_menu)*2||device_mouse_y_to_gui(0)<menu_y||device_mouse_y_to_gui(0)>menu_y+sprite_get_height(spr_menu)*2{
			if device_mouse_x_to_gui(0)<sound_x||device_mouse_x_to_gui(0)>sound_x+sprite_get_width(spr_menu_sound)*2||device_mouse_y_to_gui(0)<sound_y||device_mouse_y_to_gui(0)>sound_y+sprite_get_height(spr_menu_sound)*2{
				if device_mouse_x_to_gui(0)<music_x||device_mouse_x_to_gui(0)>music_x+sprite_get_width(spr_menu_sound)*2||device_mouse_y_to_gui(0)<music_y||device_mouse_y_to_gui(0)>music_y+sprite_get_height(spr_menu_sound)*2{
					if !obj_grapple.faded{
						obj_grapple.fade = 1
						obj_grapple.fade_x = obj_grapple.x
						obj_grapple.fade_y = obj_grapple.y
						obj_grapple.fade_angle = obj_grapple.image_angle
						obj_grapple.faded = true
					}
					grapple = 0
					obj_grapple.x = x
					obj_grapple.y = y
					obj_grapple.cur_x = 0
					obj_grapple.cur_y = 0
					obj_grapple.hsp = 0
					obj_grapple.vsp = 0
					shooting = true
					var pow = 10
					obj_grapple.hsp = lengthdir_x(pow,point_direction(x,y,mouse_x,mouse_y))
					obj_grapple.vsp = lengthdir_y(pow,point_direction(x,y,mouse_x,mouse_y))
					obj_grapple.faded = false
				}
			}
		}
	}
}
if mouse_check_button_pressed(mb_right){
	prev_grapple_angle = point_direction(x,y,grapple_x,grapple_y)
	grapple = 0
	shooting = false
	if !obj_grapple.faded{
		obj_grapple.fade = 1
		obj_grapple.fade_x = obj_grapple.x
		obj_grapple.fade_y = obj_grapple.y
		obj_grapple.fade_angle = obj_grapple.image_angle
		obj_grapple.faded = true
	}
}

if global.play{
	end_pos+=1
}


if y > 600&&!global.dead{
	if global.sound{
		audio_play_sound(snd_death,0,0)
	}
	global.dead = true
	scr_record_score(obj_menu.scr)
	global.room_change = false
}

}
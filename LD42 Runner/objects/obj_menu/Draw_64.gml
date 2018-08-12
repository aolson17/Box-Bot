if global.menu{
	draw_sprite_ext(spr_fade,0,0,0,8,10,0,c_white,1)
}
if !global.play{
	if !global.shop{
		draw_sprite_ext(spr_menu_shop,0,menu_x,menu_y,2,2,0,c_white,.8)
	}else{
		draw_sprite_ext(spr_menu_shop,0,menu_x,menu_y,2,2,0,c_white,1)
	}
	if !global.music{
		draw_sprite_ext(spr_menu_music,0,music_x,music_y,2,2,0,c_white,1)
	}else{
		draw_sprite_ext(spr_menu_music,1,music_x,music_y,2,2,0,c_white,1)
	}
	if !global.sound{
		draw_sprite_ext(spr_menu_sound,0,sound_x,sound_y,2,2,0,c_white,1)
	}else{
		draw_sprite_ext(spr_menu_sound,1,sound_x,sound_y,2,2,0,c_white,1)
	}
	if mouse_check_button_released(mb_left){
		if device_mouse_x_to_gui(0)>sound_x&&device_mouse_x_to_gui(0)<sound_x+sprite_get_width(spr_menu_sound)*2{
			if device_mouse_y_to_gui(0)>sound_y&&device_mouse_y_to_gui(0)<sound_y+sprite_get_height(spr_menu_sound)*2{
				global.sound=!global.sound
				ini_open("settings.ini")
				if ini_section_exists("Settings"){
					ini_write_real("Settings","Sound",global.sound)
				}
				ini_close()
			}
			if device_mouse_y_to_gui(0)>music_y&&device_mouse_y_to_gui(0)<music_y+sprite_get_height(spr_menu_sound)*2{
				global.music=!global.music
				ini_open("settings.ini")
				if ini_section_exists("Settings"){
					ini_write_real("Settings","Music",global.music)
				}
				ini_close()
			}
		}
	}
}else{
	if obj_player.end_pos%60=0&&!global.dead{
		scr+=1
	}
	draw_set_color(c_white)
	draw_set_font(font_big)
	scr = ceil(scr)
	draw_text(.76*view_wport[0],.82*view_hport[0],"Score: "+string(scr))
	
	switch obj_player.powerup{
	case "coin":
		draw_text(.4*view_wport[0],.9*view_hport[0],"Double Coins!")
		break
	case "break":
		draw_text(.4*view_wport[0],.9*view_hport[0],"Easy Destruction!")
		break
	case "range":
		draw_text(.4*view_wport[0],.9*view_hport[0],"Better Grapple Range!")
		break
	case "jump":
		draw_text(.4*view_wport[0],.9*view_hport[0],"Higher Jump!")
		break
	case "grav":
		draw_text(.4*view_wport[0],.9*view_hport[0],"Low Gravity!")
		break
	case "bad jump":
		draw_text(.4*view_wport[0],.9*view_hport[0],"Lower Jump")
		break
	case "bad box":
		draw_text(.4*view_wport[0],.9*view_hport[0],"Strange Pattern")
		break
	}
	
	
	
	
	
	
	
	if global.dead{
		draw_text(.38*view_wport[0],10,"Destroyed!")
		draw_sprite_ext(spr_menu_restart,0,restart_x,(menu_y+restart_y)/2,2,2,0,c_white,.8)
	}else{
		if global.menu{
			draw_sprite_ext(spr_menu,0,menu_x,menu_y,2,2,0,c_white,.8)
			draw_sprite_ext(spr_menu_restart,0,restart_x,restart_y,2,2,0,c_white,.8)
		}else{
			draw_sprite_ext(spr_menu,0,menu_x,menu_y,2,2,0,c_white,.3)
		}
	}
}

if global.menu || global.dead || !global.play{
	if !global.shop{
		draw_set_font(font_medium)
		ini_open("data.ini")
	
		if !ini_section_exists("Highscores"){// Initial highscores
			ini_write_real("Highscores","1",0)
			ini_write_real("Highscores","2",0)
			ini_write_real("Highscores","3",0)
			ini_write_real("Highscores","4",0)
			ini_write_real("Highscores","5",0)
		}
	
		var y_start = .15*view_hport[0]
		var x_start = .01*view_wport[0]
		var increment = .08*view_hport[0]
		draw_set_color(c_white)
		draw_text(x_start,y_start,"  Highscores:")
		for (var i=1;i<=5;i++){
			if i=global.place{
				draw_set_color(c_red)
			}else{
				draw_set_color(c_white)
			}
			draw_text(x_start,y_start+increment*i,"  "+string(i)+" - "+string(ini_read_real("Highscores",string(i),0)))
			draw_set_color(c_white)
		}
		ini_close()
	}
}

if global.shop{
	//speed
	//wall jump
	//jump
	//power up time
	//range
	//break speed
	draw_set_font(font_medium)
	draw_set_color(c_white)
	var pos_x = view_wport[0]*.5
	var pos_y = view_hport[0]*.3
	var increment_y = 100
	
	draw_sprite_ext(spr_coin,image_index,.54*view_wport[0],.23*view_hport[0],5,5,0,c_white,1)
	draw_text(.57*view_wport[0],.20*view_hport[0],"x"+string(coin_total))
	draw_text(.37*view_wport[0],.850*view_hport[0],"Toggle")
	for (var i = 0;i<=5;i++){
		switch(i){
			case 0:
				draw_sprite(spr_menu_buy,0,pos_x-120,pos_y-10+increment_y*i)
				if upgrade_toggle_speed{
					draw_sprite(spr_menu_check,1,pos_x-210,pos_y-7+increment_y*i)
				}else{
					draw_sprite(spr_menu_check,0,pos_x-210,pos_y-7+increment_y*i)
				}
				draw_text(pos_x,pos_y+increment_y*i,"Speed - You Have "+string(upgrade_speed))
				if mouse_check_button_released(mb_left){
					if device_mouse_y_to_gui(0)>pos_y-10+increment_y*i&&device_mouse_y_to_gui(0)<pos_y-10+increment_y*i+sprite_get_height(spr_menu_buy){
						if device_mouse_x_to_gui(0)>pos_x-120&&device_mouse_x_to_gui(0)<pos_x-120+sprite_get_width(spr_menu_buy){
							if coin_total>=1{
								coin_total-=1
								upgrade_speed++
								ini_open("data.ini")
								ini_write_real("Upgrades","Speed",upgrade_speed)
								ini_write_real("Data","Coins",coin_total)
								ini_close()
							}
						}
						if device_mouse_x_to_gui(0)>pos_x-210&&device_mouse_x_to_gui(0)<pos_x-210+sprite_get_width(spr_menu_check){
							upgrade_toggle_speed = !upgrade_toggle_speed
							ini_open("data.ini")
							ini_write_real("Upgrades Toggle","Speed",upgrade_toggle_speed)
							ini_close()
						}
					}
				}
				break
			case 1:
				draw_sprite(spr_menu_buy,0,pos_x-120,pos_y-10+increment_y*i)
				if upgrade_toggle_jump{
					draw_sprite(spr_menu_check,1,pos_x-210,pos_y-7+increment_y*i)
				}else{
					draw_sprite(spr_menu_check,0,pos_x-210,pos_y-7+increment_y*i)
				}
				draw_text(pos_x,pos_y+increment_y*i,"Jump - You Have "+string(upgrade_jump))
				if mouse_check_button_released(mb_left){
					if device_mouse_y_to_gui(0)>pos_y-10+increment_y*i&&device_mouse_y_to_gui(0)<pos_y-10+increment_y*i+sprite_get_height(spr_menu_buy){
						if device_mouse_x_to_gui(0)>pos_x-120&&device_mouse_x_to_gui(0)<pos_x-120+sprite_get_width(spr_menu_buy){
							if coin_total>=1{
								coin_total-=1
								upgrade_jump++
								ini_open("data.ini")
								ini_write_real("Upgrades","Jump",upgrade_jump)
								ini_write_real("Data","Coins",coin_total)
								ini_close()
							}
						}
						if device_mouse_x_to_gui(0)>pos_x-210&&device_mouse_x_to_gui(0)<pos_x-210+sprite_get_width(spr_menu_check){
							upgrade_toggle_jump = !upgrade_toggle_jump
							ini_open("data.ini")
							ini_write_real("Upgrades Toggle","Jump",upgrade_toggle_jump)
							ini_close()
						}
					}
				}
				break
			case 2:
				draw_sprite(spr_menu_buy,0,pos_x-120,pos_y-10+increment_y*i)
				if upgrade_toggle_wall_jump{
					draw_sprite(spr_menu_check,1,pos_x-210,pos_y-7+increment_y*i)
				}else{
					draw_sprite(spr_menu_check,0,pos_x-210,pos_y-7+increment_y*i)
				}
				draw_text(pos_x,pos_y+increment_y*i,"Wall Jump - You Have "+string(upgrade_wall_jump))
				if mouse_check_button_released(mb_left){
					if device_mouse_y_to_gui(0)>pos_y-10+increment_y*i&&device_mouse_y_to_gui(0)<pos_y-10+increment_y*i+sprite_get_height(spr_menu_buy){
						if device_mouse_x_to_gui(0)>pos_x-120&&device_mouse_x_to_gui(0)<pos_x-120+sprite_get_width(spr_menu_buy){
							if coin_total>=1{
								coin_total-=1
								upgrade_wall_jump++
								ini_open("data.ini")
								ini_write_real("Upgrades","Wall Jump",upgrade_wall_jump)
								ini_write_real("Data","Coins",coin_total)
								ini_close()
							}
						}
						if device_mouse_x_to_gui(0)>pos_x-210&&device_mouse_x_to_gui(0)<pos_x-210+sprite_get_width(spr_menu_check){
							upgrade_toggle_wall_jump = !upgrade_toggle_wall_jump
							ini_open("data.ini")
							ini_write_real("Upgrades Toggle","Wall Jump",upgrade_toggle_wall_jump)
							ini_close()
						}
					}
				}
				break
			case 3:
				draw_sprite(spr_menu_buy,0,pos_x-120,pos_y-10+increment_y*i)
				if upgrade_toggle_power_time{
					draw_sprite(spr_menu_check,1,pos_x-210,pos_y-7+increment_y*i)
				}else{
					draw_sprite(spr_menu_check,0,pos_x-210,pos_y-7+increment_y*i)
				}
				draw_text(pos_x,pos_y+increment_y*i,"Power Time - You Have "+string(upgrade_power_time))
				if mouse_check_button_released(mb_left){
					if device_mouse_y_to_gui(0)>pos_y-10+increment_y*i&&device_mouse_y_to_gui(0)<pos_y-10+increment_y*i+sprite_get_height(spr_menu_buy){
						if device_mouse_x_to_gui(0)>pos_x-120&&device_mouse_x_to_gui(0)<pos_x-120+sprite_get_width(spr_menu_buy){
							if coin_total>=1{
								coin_total-=1
								upgrade_power_time++
								ini_open("data.ini")
								ini_write_real("Upgrades","Power Time",upgrade_power_time)
								ini_write_real("Data","Coins",coin_total)
								ini_close()
							}
						}
						if device_mouse_x_to_gui(0)>pos_x-210&&device_mouse_x_to_gui(0)<pos_x-210+sprite_get_width(spr_menu_check){
							upgrade_toggle_power_time = !upgrade_toggle_power_time
							ini_open("data.ini")
							ini_write_real("Upgrades Toggle","Power Time",upgrade_toggle_power_time)
							ini_close()
						}
					}
				}
				break
			case 4:
				draw_sprite(spr_menu_buy,0,pos_x-120,pos_y-10+increment_y*i)
				if upgrade_toggle_range{
					draw_sprite(spr_menu_check,1,pos_x-210,pos_y-7+increment_y*i)
				}else{
					draw_sprite(spr_menu_check,0,pos_x-210,pos_y-7+increment_y*i)
				}
				draw_text(pos_x,pos_y+increment_y*i,"Range - You Have "+string(upgrade_range))
				if mouse_check_button_released(mb_left){
					if device_mouse_y_to_gui(0)>pos_y-10+increment_y*i&&device_mouse_y_to_gui(0)<pos_y-10+increment_y*i+sprite_get_height(spr_menu_buy){
						if device_mouse_x_to_gui(0)>pos_x-120&&device_mouse_x_to_gui(0)<pos_x-120+sprite_get_width(spr_menu_buy){
							if coin_total>=1{
								coin_total-=1
								upgrade_range++
								ini_open("data.ini")
								ini_write_real("Upgrades","Wall Jump",upgrade_range)
								ini_write_real("Data","Coins",upgrade_range)
								ini_close()
							}
						}
						if device_mouse_x_to_gui(0)>pos_x-210&&device_mouse_x_to_gui(0)<pos_x-210+sprite_get_width(spr_menu_check){
							upgrade_toggle_range = !upgrade_toggle_range
							ini_open("data.ini")
							ini_write_real("Upgrades Toggle","Range",upgrade_toggle_range)
							ini_close()
						}
					}
				}
				break
			case 5:
				draw_sprite(spr_menu_buy,0,pos_x-120,pos_y-10+increment_y*i)
				if upgrade_toggle_break_speed{
					draw_sprite(spr_menu_check,1,pos_x-210,pos_y-7+increment_y*i)
				}else{
					draw_sprite(spr_menu_check,0,pos_x-210,pos_y-7+increment_y*i)
				}
				draw_text(pos_x,pos_y+increment_y*i,"Break Power - You Have "+string(upgrade_break_speed))
				if mouse_check_button_released(mb_left){
					if device_mouse_y_to_gui(0)>pos_y-10+increment_y*i&&device_mouse_y_to_gui(0)<pos_y-10+increment_y*i+sprite_get_height(spr_menu_buy){
						if device_mouse_x_to_gui(0)>pos_x-120&&device_mouse_x_to_gui(0)<pos_x-120+sprite_get_width(spr_menu_buy){
							if coin_total>=1{
								coin_total-=1
								upgrade_break_speed++
								ini_open("data.ini")
								ini_write_real("Upgrades","Break Speed",upgrade_break_speed)
								ini_write_real("Data","Coins",coin_total)
								ini_close()
							}
						}
						if device_mouse_x_to_gui(0)>pos_x-210&&device_mouse_x_to_gui(0)<pos_x-210+sprite_get_width(spr_menu_check){
							upgrade_toggle_break_speed = !upgrade_toggle_break_speed
							ini_open("data.ini")
							ini_write_real("Upgrades Toggle","Break Speed",upgrade_toggle_break_speed)
							ini_close()
						}
					}
				}
				break
		}
	}
}else{
	draw_sprite_ext(spr_coin,image_index,.82*view_wport[0],.93*view_hport[0],5,5,0,c_white,1)
	draw_text(.85*view_wport[0],.9*view_hport[0],"x"+string(coin_total))
}



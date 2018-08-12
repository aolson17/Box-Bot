if global.play{global.shop = false}

if !global.menu{
	layer_hspeed("Background",1)
}else{
	layer_hspeed("Background",0)
}

if mouse_check_button_released(mb_left){
	if device_mouse_x_to_gui(0)>menu_x&&device_mouse_x_to_gui(0)<menu_x+sprite_get_width(spr_menu)*2{
		if device_mouse_y_to_gui(0)>menu_y&&device_mouse_y_to_gui(0)<menu_y+sprite_get_height(spr_menu)*2{
			if !global.play{
				if !global.shop{
					global.shop = true
				}else{
					global.shop = false
				}
			}else{
				if global.dead{
					room_restart()
				}else{
					global.menu = !global.menu
				}
			}
		}
		if global.dead{
			if device_mouse_y_to_gui(0)>(menu_y+restart_y)/2&&device_mouse_y_to_gui(0)<(menu_y+restart_y)/2+sprite_get_height(spr_menu)*2{
				global.room_change = false
				room_restart()
			}
		}else{
			if global.menu{
				if device_mouse_y_to_gui(0)>restart_y&&device_mouse_y_to_gui(0)<restart_y+sprite_get_height(spr_menu)*2{
					global.room_change = false
					room_restart()
				}
			}
		}
	}
}
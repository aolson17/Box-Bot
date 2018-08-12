image_speed = 1
collected = false

var ran = irandom(6)
switch ran{
	case 0:
		pow = "coin"
		pow_time = 30+(obj_menu.upgrade_power_time*.2)*obj_menu.upgrade_toggle_power_time
		sprite_index = spr_pow_coin
		break
	case 1:
		pow = "break"
		pow_time = 15+(obj_menu.upgrade_power_time*.2)*obj_menu.upgrade_toggle_power_time
		sprite_index = spr_pow_break
		break
	case 2:
		pow = "range"
		pow_time = 15+(obj_menu.upgrade_power_time*.2)*obj_menu.upgrade_toggle_power_time
		sprite_index = spr_pow_range
		break
	case 3:
		pow = "jump"
		pow_time = 10+(obj_menu.upgrade_power_time*.2)*obj_menu.upgrade_toggle_power_time
		sprite_index = spr_pow_jump
		break
	case 4:
		pow = "grav"
		pow_time = 10+(obj_menu.upgrade_power_time*.2)*obj_menu.upgrade_toggle_power_time
		sprite_index = spr_pow_grav
		break
	case 5:
		pow = "bad jump"
		pow_time = 10
		sprite_index = spr_bad_jump
		break
	case 6:
		if room != Alternate{
			pow = "bad box"
			pow_time = 20
			sprite_index = spr_bad_box
		}else{
			pow = "range"
			pow_time = 30+(obj_menu.upgrade_power_time*.2)*obj_menu.upgrade_toggle_power_time
			sprite_index = spr_pow_range
		}
		break
}
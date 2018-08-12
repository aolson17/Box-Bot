scr = 0

gui_width = display_get_gui_width()
gui_height = display_get_gui_height()

gui_x = gui_width*.2
gui_y = gui_height*.65

menu_x = 10//gui_width*.85
menu_y = gui_height*.85

sound_x = gui_width*.76
sound_y = 30//gui_height*.5

music_x = gui_width*.76
music_y = gui_height*.2

shop_x = 10
shop_y = gui_height*.65

restart_x = 10
restart_y = gui_height*.65


ini_open("settings.ini")
if ini_section_exists("Settings"){
	global.sound = ini_read_real("Settings","Sound",true)
	global.music = ini_read_real("Settings","Music",true)
}else{
	ini_write_real("Settings","Sound",true)
	ini_write_real("Settings","Music",true)
	global.sound = true
	global.music = true
}
ini_close()

ini_open("data.ini")
if ini_section_exists("Data"){
	coin_total = ini_read_real("Data","Coins",0)
}else{
	ini_write_real("Data","Coins",0)
	coin_total = 0
}
if ini_section_exists("Upgrades"){
	upgrade_speed = ini_read_real("Upgrades","Speed",0)
	upgrade_wall_jump = ini_read_real("Upgrades","Wall Jump",0)
	upgrade_jump = ini_read_real("Upgrades","Jump",0)
	upgrade_power_time = ini_read_real("Upgrades","Power Time",0)
	upgrade_range = ini_read_real("Upgrades","Range",0)
	upgrade_break_speed = ini_read_real("Upgrades","Break Speed",0)
	upgrade_toggle_speed = ini_read_real("Upgrades Toggle","Speed",1)
	upgrade_toggle_wall_jump = ini_read_real("Upgrades Toggle","Wall Jump",1)
	upgrade_toggle_jump = ini_read_real("Upgrades Toggle","Jump",1)
	upgrade_toggle_power_time = ini_read_real("Upgrades Toggle","Power Time",1)
	upgrade_toggle_range = ini_read_real("Upgrades Toggle","Range",1)
	upgrade_toggle_break_speed = ini_read_real("Upgrades Toggle","Break Speed",1)
}else{
	ini_write_real("Upgrades","Speed",0)
	ini_write_real("Upgrades","Wall Jump",0)
	ini_write_real("Upgrades","Jump",0)
	ini_write_real("Upgrades","Power Time",0)
	ini_write_real("Upgrades","Range",0)
	ini_write_real("Upgrades","Break Speed",0)
	ini_write_real("Upgrades Toggle","Speed",1)
	ini_write_real("Upgrades Toggle","Wall Jump",1)
	ini_write_real("Upgrades Toggle","Jump",1)
	ini_write_real("Upgrades Toggle","Power Time",1)
	ini_write_real("Upgrades Toggle","Range",1)
	ini_write_real("Upgrades Toggle","Break Speed",1)
	upgrade_speed = 0
	upgrade_wall_jump = 0
	upgrade_jump = 0
	upgrade_power_time = 0
	upgrade_range = 0
	upgrade_break_speed = 0
	upgrade_toggle_speed = 1
	upgrade_toggle_wall_jump = 1
	upgrade_toggle_jump = 1
	upgrade_toggle_power_time = 1
	upgrade_toggle_range = 1
	upgrade_toggle_break_speed = 1
}
ini_close()

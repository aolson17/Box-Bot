if !collected{
	//obj_player.new_coins++
	obj_menu.scr*=1.2
	collected = true
	if global.sound{
		audio_play_sound(snd_coin,0,0)
	}
	obj_menu.coin_total+=1
	ini_open("data.ini")
	ini_write_real("Data","Coins",obj_menu.coin_total)
	ini_close()
}

if !collected{
	obj_player.powerup = pow
	obj_player.pow_time = pow_time
	if global.sound{
		audio_play_sound(snd_coin,0,0)
	}
	obj_menu.scr+=10
	collected = true
}
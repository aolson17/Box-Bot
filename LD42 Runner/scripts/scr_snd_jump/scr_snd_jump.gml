///scr_snd_jump()
if global.sound{
	audio_play_sound(snd_jump,0,0)
	audio_sound_pitch(snd_jump,random_range(7,.9))
}

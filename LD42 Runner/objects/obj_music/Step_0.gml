if global.music{
	if !audio_is_playing(snd_music){
		audio_play_sound(snd_music,0,1)
		audio_sound_gain(snd_music,0,0)
		audio_sound_gain(snd_music,0.02,5000)
	}
}else{
	if audio_is_playing(snd_music){
		audio_stop_sound(snd_music)
	}
}
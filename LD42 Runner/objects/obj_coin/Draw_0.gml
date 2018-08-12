if link != "nope"{
	if instance_number(link)>0{
		if link.inside{
			draw_self()
		}
	}else{
		instance_destroy()
	}
}else{
	draw_self()
}

image_speed = 0
image_index = irandom_range(1,11)
if place_meeting(x,y,obj_pallet)||place_meeting(x,y,obj_box){
	//instance_destroy()
}
if irandom(4)=0{
	switch irandom(3){
		case 3:coin = 0
			break
		case 2:coin = 90
			break
		case 1:coin = 180
			break
		case 0:coin = 270
			break
	}
}else{
	coin = -1
}
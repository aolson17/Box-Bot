/// @description Room Change
if global.room_change = false{// Only change rooms once
	randomize()
	if room = room01{
		if irandom(1)=0{
			room_goto_next()
			global.room_change = true
		}
	}else{
		if irandom(1)=0{
			room_goto_previous()
			global.room_change = true
		}
	}
}
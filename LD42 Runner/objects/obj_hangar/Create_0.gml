randomize()
if global.play{
	var ran = irandom(2)
	if ran=2{
		instance_create_layer(x,y+50,"Instances",obj_box)
		instance_create_layer(x,y+114,"Instances",obj_box)
	}
	if ran=1{
		instance_create_layer(x,y+114,"Instances",obj_box)
	}
}
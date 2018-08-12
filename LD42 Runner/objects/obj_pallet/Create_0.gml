var ran = irandom(4)
if ran=2{
	instance_create_layer(x+4,y-192,"Instances",obj_box)
	instance_create_layer(x+4,y-128,"Instances",obj_box)
	instance_create_layer(x+4,y-64,"Instances",obj_box)
}
if ran=1||ran=3{
	instance_create_layer(x+4,y-128,"Instances",obj_box)
	instance_create_layer(x+4,y-64,"Instances",obj_box)
}
if ran=0||ran=4{
	instance_create_layer(x+4,y-64,"Instances",obj_box)
}

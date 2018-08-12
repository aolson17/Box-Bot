/*if obj_player.magnitude >= 5{
	instance_create_layer(x,y,layer,obj_box_broken)
	instance_create_layer(x,y,layer,obj_box_wall)
	new = instance_create_layer(x,y,"Instances_2",obj_box_wall)
	new.image_angle = 180
	new = instance_create_layer(x,y,"Instances_2",obj_box_wall)
	new.image_angle = 90
	new = instance_create_layer(x,y,"Instances_2",obj_box_wall)
	new.image_angle = 270
	instance_destroy()
}
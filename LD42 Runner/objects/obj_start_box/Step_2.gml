if image_index != 0&&new = false{
	new = instance_create_layer(x,y,layer,obj_start_box_wall)
	new.sprite_index = spr_box_wall_top
}
//if x > obj_belt{x-=2}
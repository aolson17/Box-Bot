if global.play&&!global.menu{
	x+=1
	
	if room != Alternate{
		if obj_player.powerup != "bad box"{
			if obj_player.end_pos%64=0{
				if irandom(100)<50{
					instance_create_layer(x+40,y,"Instances_1",obj_hangar)
	
	
				}
	
				if irandom(100)<60{
					instance_create_layer(x+36,412,"Instances",obj_pallet)
	
	
				}else{
					if irandom(100)<20{
						instance_create_layer(x+40,354,"Instances",obj_box)
					}else{
						if irandom(100)<10{
							instance_create_layer(x+40,354,"Instances",obj_box)
							instance_create_layer(x+40,290,"Instances",obj_box)
						}
					}
				}
		
			
				if irandom(100)<10{
					c = instance_create_layer(x+72,20,"Instances",obj_coin)
					c.link = "nope"// not linked to a box
				}else{
					if irandom(100)<10{
						instance_create_layer(x+72,20,"Instances",obj_pow)
					}
				}
				if irandom(100)<10{
					instance_create_layer(x+72,340,"Instances",obj_pow)
				}
				if irandom(100)<5{
					instance_create_layer(x+72,150,"Instances",obj_pow)
				}
			}
		}else{
			if obj_player.end_pos%256=0{
				if irandom(100)<100{
					instance_create_layer(x+40,228,"Instances",obj_box)
					instance_create_layer(x+40,354,"Instances",obj_box)
					instance_create_layer(x+40,292,"Instances",obj_box)
				}
			
				if irandom(100)<10{
					instance_create_layer(x+72,340,"Instances",obj_pow)
				}
			}
		}
	}else{// Alternate Generation
		if obj_player.end_pos%64=0{
			if irandom(100)<50||not_made>=3{
				instance_create_layer(x+40,y,"Instances_1",obj_hangar)
				not_made=0
			}else{
				not_made++
			}
			if irandom(100)<10{
				c = instance_create_layer(x+72,20,"Instances",obj_coin)
				c.link = "nope"// not linked to a box
			}else if irandom(100)<10{
				c = instance_create_layer(x+72,320,"Instances",obj_coin)
				c.link = "nope"// not linked to a box
			}else{
				if irandom(100)<10{
					instance_create_layer(x+72,20,"Instances",obj_pow)
				}
			}
			if irandom(100)<10{
				instance_create_layer(x+72,340,"Instances",obj_pow)
			}
			if irandom(100)<5{
				instance_create_layer(x+72,150,"Instances",obj_pow)
			}
			if irandom(100)<5{
				instance_create_layer(x+72,200,"Instances",obj_pow)
			}
		}
	}
}

if!global.menu{
	image_speed = .5
}else{
	image_speed = 0
}
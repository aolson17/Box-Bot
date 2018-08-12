

target_distance = spd*20

distance += (target_distance-distance)/5

x = follow.x //+ lengthdir_x(distance + 30,follow.image_angle)
y = follow.y+200 //+ lengthdir_y(distance + 30,follow.image_angle)

if follow != noone{
	x_to = follow.x
	y_to = follow.y
}



//xup = cos(-(follow.image_angle-180)*0.01745329252)
//yup = sin(-(follow.image_angle-180)*0.01745329252)

//var vm = matrix_build_lookat(x,y,-10,x,y,0,xup,yup,0)


//cur_angle += angle_speed*angle_difference(follow.image_angle, cur_angle)

if round(cur_angle/1)*1 = round(follow.image_angle/1)*1{
	angle_speed = 1
}


//xup = cos(-(cur_angle-180)*0.01745329252)
//yup = sin(-(cur_angle-180)*0.01745329252)

var vm = matrix_build_lookat(x,y,-10,x,y,0,xup,yup,0)


//var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
camera_set_view_mat(camera,vm)

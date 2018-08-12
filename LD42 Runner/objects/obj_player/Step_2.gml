/// @description Insert description here
// You can write your code in this editor

if !global.menu&&!global.shop{
prev_camera_x = x+lengthdir_x(point_distance(x,y,mouse_x,mouse_y)/20,point_direction(x,y,mouse_x,mouse_y))
prev_camera_y = y+lengthdir_y(point_distance(x,y,mouse_x,mouse_y)/20,point_direction(x,y,mouse_x,mouse_y))
}
var vm = matrix_build_lookat(prev_camera_x,prev_camera_y,-10,prev_camera_x,prev_camera_y,0,0,1,0)



camera_set_view_mat(camera,vm)
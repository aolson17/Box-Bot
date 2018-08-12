
xup = 0
yup = 0

cur_angle = 0

angle_speed = .2

camera = camera_create()

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
var pm = matrix_build_projection_ortho(426,240,1,10000)

camera_set_view_mat(camera,vm)
camera_set_proj_mat(camera,pm)

view_camera[0] = camera

follow = obj_player

x = follow.x
y = follow.y

spd = 0

target_distance = 0
distance = 0


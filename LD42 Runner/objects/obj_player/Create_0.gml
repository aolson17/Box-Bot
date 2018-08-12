
powerup = "none"
pow_time = 0
shooting = false
cur_x = 0
cur_y = 0
hsp = 0
vsp = 0
jump = 0
angle=0
grapple = 0
grapple_x = 0
grapple_y = 0
length = 0
magnitude = 0
dir = 0
jump_ready = true
prev_grapple_angle = 0
end_pos = -45
new_coins = 0
alpha_dead = 0
prev_camera_x = 0
prev_camera_y = 0

//Variables
jumpstoprate = .8
wallspeed = 1
acceleration = .02
fallspeed = 20
xfriction = .05
airResistance = .1
stepheight = 8
airMovePercent = .3
stepSpeedPercent = .3
slowSpeed = 1

global.play = false
global.inside = true
global.dead = false
global.shop = false
global.place = -1
global.menu = false

camera = camera_create()

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
var pm = matrix_build_projection_ortho(426,240,1,10000)

camera_set_view_mat(camera,vm)
camera_set_proj_mat(camera,pm)

view_camera[0] = camera
alarm[0]=1

var left, right, up, down;
var moving = false;
var moveSpeed = 1;
var tileSize = 16;
var collision_list = [obj_bush,obj_highWallBack,obj_highWallBackLeft,obj_highWallBackRight,obj_highWallBottom,obj_highWallBottomLeft, obj_highWallBottomRight, obj_highWallCenterLeft, obj_highWallCenterRight,obj_highWallInsideLeft, obj_highWallInsideRight, obj_highWallLeft, obj_highWallRight,obj_highWallTop,obj_highWallTopLeft,obj_highWallTopRight,obj_ocean,obj_house,obj_tree,obj_beachImpassible];

left = keyboard_check_direct(vk_left);
right = keyboard_check_direct(vk_right);
up = keyboard_check_direct(vk_up);
down = keyboard_check_direct(vk_down);

if(left)
{
	image_index = 3;
	moving = true;
	self.facing = "Left";
}

if(right)
{
	image_index = 2;
	moving = true;
	self.facing = "Right";
}

if(up)
{
	image_index = 1;
	moving = true;
	self.facing = "Up";
}

if(down)
{
	image_index = 0;
	moving = true;
	self.facing = "Down";
}

if (moving) {
	switch (self.facing) {
		// can change image index here
		case "Up":
			//y -= moveSpeed;
			move_and_collide(0,-1,collision_list)
			break;
		case "Down":
			//y += moveSpeed;
			move_and_collide(0,1,collision_list)
			break;
		case "Left":
			//x -= moveSpeed;
			move_and_collide(-1,0,collision_list)
			break;
		case "Right":
			//x += moveSpeed;
			move_and_collide(1,0,collision_list)
			break;
		default:
			break;
	}
}

if (!up and !down and !left and !right) {
	moving = false;	
}

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (self.x + 8 < cam_x) {
	// passed camera boundary on the left	
	camera_set_view_pos(view_camera[0], cam_x - 128, cam_y);
} else if (self.x + 8 > cam_x + 128) {
	// passed camera boundary on the right
	camera_set_view_pos(view_camera[0], cam_x + 128, cam_y);
} else if (self.y + 8 < cam_y) {
	// passed camera boundary up
	camera_set_view_pos(view_camera[0], cam_x, cam_y - 128);
} else if (self.y + 8 > cam_y + 128) {
	// passed camera boundary down
	camera_set_view_pos(view_camera[0], cam_x, cam_y + 128);
}

//if ((x % 128 == 15) or (x % 128 == 127)) {
//	//  met horizontal viewport boundary, 
//	//  freeze all instances, 
//	//  move camera to new location and snap Link
//	//  to the nearest location on the new viewport
//	instance_deactivate_all(true);
	
//	var new_camera_x = -1;
//	if (self.facing == "Right") {
//		new_camera_x = self.x;	
//	} else if (self.facing == "Left") {
//		new_camera_x = self.x - 128;	
//	} // don't default to one direction or another, that's buggy
	
//	// todo: loop to slide camera
//	//camera_set_view_pos(view_camera[0], new_camera_x, view_camera[0].y);
//	camera_set_view_pos(view_camera[0], new_camera_x, self.y - (self.y % 128));
	
//	instance_activate_all();
//}

//if ((y % 128 == 15) or (y % 128 == 127)) {
//	//  met vertical viewport boundary, 
//	//  freeze all instances, 
//	//  move camera to new location and snap Link
//	//  to the nearest location on the new viewport
//	instance_deactivate_all(true);
	
//	var new_camera_y = -1;
//	if (self.facing == "Down") {
//		new_camera_y = self.y;	
//	} else if (self.facing == "Up") {
//		new_camera_y = self.y - 128;
//		self.y -= 16;
//	} // don't default to one direction or another, that's buggy
	
//	// todo: loop to slide camera
//	//camera_set_view_pos(view_camera[0], new_camera_x, view_camera[0].y);
//	camera_set_view_pos(view_camera[0], self.x - (self.x % 128), new_camera_y);
	
//	instance_activate_all();
//}
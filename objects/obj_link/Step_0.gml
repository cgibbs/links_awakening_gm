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
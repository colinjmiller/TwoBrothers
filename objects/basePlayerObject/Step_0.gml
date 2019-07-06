/// @description Insert description here
// You can write your code in this editor

downKeyPressed = keyboard_check_pressed(downKey);
upKeyPressed = keyboard_check_pressed(upKey);
leftKeyPressed = keyboard_check_pressed(leftKey);
rightKeyPressed = keyboard_check_pressed(rightKey);
fireKeyPressed = keyboard_check_pressed(fireKey);

if (god.canMove && canMove) {
	if (anyScript(downKeyPressed, upKeyPressed, leftKeyPressed, rightKeyPressed, fireKeyPressed)) {
		canMove = false;
		alarm[0] = god.millisecondOffset / 1000 * room_speed;
		
		if (downKeyPressed) {
			if (y + sprite_height < room_height) {
				y += sprite_height;
			}
		} else if (upKeyPressed) {
			if (y - sprite_height >= 0) {
				y -= sprite_height;	
			}
		} else if (leftKeyPressed) {
			if (x - sprite_width >= 0) {
				x -= sprite_width;
			}
		} else if (rightKeyPressed) {
			if (x + sprite_width < room_width) {
				x += sprite_width;
			}
		} else if (fireKeyPressed) {
			bullet = instance_create_depth(x, y, 1, bulletObject);
			with (bullet) {
				bulletDirection = other.shootDirection;
				bulletOwner = other.player;
			}
		}
	}
}

/*
if (god.canMove) {
	image_alpha = 1;
} else {
	image_alpha = 0;
}
*/
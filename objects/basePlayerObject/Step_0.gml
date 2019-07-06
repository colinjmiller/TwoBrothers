/// @description Insert description here
// You can write your code in this editor

if (god.beatIncremented) {
	if (offBeatAttempt) {
		show_debug_message("No movement this round penalty");
		offBeatAttempt = false;	
	} else {
		canMove = true;	
	}
	
	if (god.currentBeat % 4 == 3) {
		ammo = min(ammo + 1, 5);	
	}	
}

downKeyPressed = keyboard_check_pressed(downKey);
upKeyPressed = keyboard_check_pressed(upKey);
leftKeyPressed = keyboard_check_pressed(leftKey);
rightKeyPressed = keyboard_check_pressed(rightKey);
fireKeyPressed = keyboard_check_pressed(fireKey);


if (anyScript(downKeyPressed, upKeyPressed, leftKeyPressed, rightKeyPressed, fireKeyPressed)) {
	if (god.canMove && canMove) {
		canMove = false;
		
		if (downKeyPressed) {
			if (collision_point(x, y + sprite_height, gridObject, false, true)) {
				y += sprite_height;
			}
		} else if (upKeyPressed) {
			if (collision_point(x, y - sprite_height, gridObject, false, true)) {
				y -= sprite_height;	
			}
		} else if (leftKeyPressed) {
			if (collision_point(x - sprite_width, y, gridObject, false, true)) {
				x -= sprite_width;
			}
		} else if (rightKeyPressed) {
			if (collision_point(x + sprite_width, y, gridObject, false, true)) {
				x += sprite_width;
			}
		} else if (fireKeyPressed) {
			if (ammo > 0) {
				ammo--;
				bullet = instance_create_depth(x, y, 1, bulletObject);
				with (bullet) {
					image_xscale = other.shootDirection;	
					bulletOwner = other.player;
				}
			}
		}
	} else {
		show_debug_message("No movement for you!");
		offBeatAttempt = true;
		canMove = false;
	}
}
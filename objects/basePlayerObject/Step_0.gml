/// @description Insert description here
// You can write your code in this editor

if (god.beatIncremented) {
	if (offBeatAttempts < 2) {
		image_alpha = 1;
		canMove = true;	
	} else {
		// Adjust alpha to clarify penalty state
		image_alpha = .5;
		audio_play_sound(penaltySound, 0, false);
	}
	offBeatAttempts = 0;
	
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
			if (collision_point(x - sprite_width, y, gridObject, false, true) && (x - sprite_width) >= maxLeft) {
				x -= sprite_width;
			}
		} else if (rightKeyPressed) {
			if (collision_point(x + sprite_width, y, gridObject, false, true) && (x + sprite_width) <= maxRight) {
				x += sprite_width;
			}
		} else if (fireKeyPressed) {
			if (ammo > 0) {
				ammo--;
				bullet = instance_create_depth(x, y, 9000, bulletObject);
				audio_play_sound(pyewSound, 0, false);
				with (bullet) {
					image_xscale = other.shootDirection;	
					bulletOwner = other.player;
				}
			}
		}
	} else {
		offBeatAttempts++;
	}
}
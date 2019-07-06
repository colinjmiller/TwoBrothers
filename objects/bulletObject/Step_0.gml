/// @description Insert description here
// You can write your code in this editor

if (god.canMove && canMove) {
	canMove = false;
	x += sprite_width;
}

// After each beat, reset for the next beat
if (!god.canMove) {
	canMove = true;
}
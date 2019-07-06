/// @description Insert description here
// You can write your code in this editor

millisecondsSinceStart += (delta_time / 1000);

if (millisecondsSinceStart % millisecondsPerBeat < millisecondOffset || millisecondsSinceStart % millisecondsPerBeat > (millisecondsPerBeat - millisecondOffset)) {
	canMove = true;	
} else {
	canMove = false;
}
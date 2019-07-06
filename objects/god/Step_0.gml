/// @description Insert description here
// You can write your code in this editor

millisecondsSinceStart += (delta_time / 1000);
beatIncremented = false;

if (millisecondsSinceStart % millisecondsPerBeat < millisecondOffset || millisecondsSinceStart % millisecondsPerBeat > (millisecondsPerBeat - millisecondOffset)) {
	if (!canMove) {
		canMove = true;
		currentBeat++;
		beatIncremented = true;
	}
} else {
	canMove = false;
}
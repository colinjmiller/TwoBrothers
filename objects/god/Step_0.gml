/// @description Insert description here
// You can write your code in this editor

millisecondsSinceStart += (delta_time / 1000);
beatIncremented = false;

// roundWinner is 0 when there's no winner yet. If it's 1 or 2, restart the same
if (roundWinner) {
	if (roundWinner == 1) {
		playerOneScore++;	
	} else {
		playerTwoScore++;	
	}
	roundWinner = 0;
	
	if (playerOneScore > 2 || playerTwoScore > 2) {
		gameOver = true;
		audio_stop_sound(music);
	}
	
	// Remove all the bullets in the field
	instance_destroy(bulletObject);
	room_restart();
}

if (millisecondsSinceStart % millisecondsPerBeat < millisecondOffset || millisecondsSinceStart % millisecondsPerBeat > (millisecondsPerBeat - millisecondOffset)) {
	if (!canMove) {
		canMove = true;
		currentBeat++;
		beatIncremented = true;
	}
} else {
	canMove = false;
}
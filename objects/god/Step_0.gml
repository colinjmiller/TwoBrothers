/// @description Insert description here
// You can write your code in this editor

millisecondsSinceStart += (delta_time / 1000);
beatIncremented = false;

if (room == game) {
	// roundWinner is 0 when there's no winner yet. If it's 1 or 2, restart the same
	if (roundWinner) {
		show_debug_message("Going to winner room");
		// room_goto(winner);
		if (roundWinner == 1) {
			playerOneScore++;	
		} else {
			playerTwoScore++;	
		}
		
		if (playerOneScore > 2 || playerTwoScore > 2) {
			gameOver = true;
			audio_stop_sound(music);
		}
		
		roundWinner = 0;
	
		// Remove all the bullets in the field
		instance_destroy(bulletObject);
		room_restart();
	}
	
	if (millisecondsSinceStart % millisecondsPerBeat < millisecondOffset || millisecondsSinceStart % millisecondsPerBeat > (millisecondsPerBeat - millisecondOffset)) {
		if (!canMove) {
			canMove = true;
			currentBeat++;
			lazerCounter++;
			beatIncremented = true;
			show_debug_message(lazerCounter);
			
			if (lazerCounter == lazerStart) {
				show_debug_message("Starting lazer in " + string(millisecondOffset) + " milliseconds");
				alarm[0] = millisecondOffset;
			}
			
			if (lazerCounter > lazerStart + LAZER_DURATION) {
				show_debug_message("Lazer Off");
				lazerCounter = -1;
				lazerActive = false;
			}
		}
	} else {
		canMove = false;
	}
}
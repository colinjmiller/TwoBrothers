/// @description Insert description here
// You can write your code in this editor

gameOver = false;
playerOneScore = 0;
playerTwoScore = 0;
roundWinner = 0;

music = music120BPMSound;
var beatsPerMinute = 120;
var movementWindowPercent = .25;
beatsPerSecond = beatsPerMinute / 60;
millisecondsPerBeat = 1000 / beatsPerSecond;
millisecondOffset = (1000 / beatsPerSecond * movementWindowPercent);

if (room == game) {
	audio_play_sound(music, 10, true);
	//audio_play_sound(metranome120BPMSound, 10, true);
}

millisecondsSinceStart = 0;
currentBeat = -1;
beatIncremented = false;
canMove = false;

LAZER_DURATION = 4;
lazerCounter = -1;
lazerStart = 4;
lazerHorizontal = false;
lazerPosition = 0;
lazerActive = false;

prizes = [
	"Big PP Award",
	"Winner of the century",
	"Big Winner Award",
	"Flawless Victor Award",
	"Nice Work Award",
	"Way To Go Award",
	"You Crushed Your Opponent and Drank Their Blood",
	"Cool."
];
prize = prizes[irandom_range(0, array_length_1d(prizes))];
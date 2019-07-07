/// @description Insert description here
// You can write your code in this editor

gameOver = false;
playerOneScore = 0;
playerTwoScore = 0;
roundWinner = 0;

music = metranome60BPMSound;
var beatsPerMinute = 60;
var movementWindowPercent = .25;
beatsPerSecond = beatsPerMinute / 60;
millisecondsPerBeat = 1000 / beatsPerSecond;
millisecondOffset = (1000 / beatsPerSecond * movementWindowPercent);
audio_play_sound(music, 10, true);

millisecondsSinceStart = 0;
currentBeat = -1;
beatIncremented = false;
canMove = false;

/// @description Insert description here
// You can write your code in this editor

gameOver = false;

var beatsPerMinute = 120;
var movementWindowPercent = .25;
beatsPerSecond = beatsPerMinute / 60;
millisecondsPerBeat = 1000 / beatsPerSecond;
millisecondOffset = (1000 / beatsPerSecond * movementWindowPercent);
audio_play_sound(metranome120BPMSound, 10, true);

millisecondsSinceStart = 0;
currentBeat = -1;
beatIncremented = false;
canMove = false;

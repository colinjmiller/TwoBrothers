/// @description Insert description here
// You can write your code in this editor

if (other.bulletOwner != player) {
	god.gameOver = true;
	audio_stop_sound(metranome120BPMSound);
	instance_destroy();
}
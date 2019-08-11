/// @description Insert description here
// You can write your code in this editor

if (other.bulletOwner != player) {
	if (random_range(1, 1000) > 10) {
		audio_play_sound(deathSound, 0, false);	
	} else {
		audio_play_sound(peeyusSound, 0, false);
	}
	god.roundWinner = (player == 1) ? 2 : 1;
}
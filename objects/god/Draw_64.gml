/// @description Insert description here
// You can write your code in this editor

var squareCount = currentBeat % 4 + 1;
var boxYPosition = room_height - 64;
var boxWidth = room_width / 4;

if (!gameOver) {
	for (var i = 0; i < squareCount; i++) {
		var color = squareCount == 4 ? c_yellow : c_green;
		var x1 = i * boxWidth;
		var x2 = (i + 1) * boxWidth;
		draw_rectangle_color(x1, boxYPosition, x2, room_height, color, color, color, color, false);
	}

	var textColor = c_black;
	draw_text_colour(0, 0, playerTwoObject.ammo, textColor, textColor, textColor, textColor, 1);
	draw_text_colour(room_width - 10, 0, playerOneObject.ammo, textColor, textColor, textColor, textColor, 1);	
} else {
	var textColor = c_white;
	draw_text_colour(0, boxYPosition, "Winner, winner, chicken dinner", textColor, textColor, textColor, textColor, 1);
}
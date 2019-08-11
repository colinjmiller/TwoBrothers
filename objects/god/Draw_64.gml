/// @description Insert description here
// You can write your code in this editor

if (room == game) {
	// Game wins UI
	var winningCircleDiameter = 24;
	var unfilledCircleColor = c_white;
	var playerOneCircleColor = c_blue;
	var playerTwoCircleColor = c_green;
	var winningCircleColor = unfilledCircleColor;
	if (playerOneScore > 2) {
		winningCircleColor = playerOneCircleColor;
	} else if (playerTwoScore > 2) {
		winningCircleColor = playerTwoCircleColor;
	}
	draw_circle_color(room_width / 2 - 64, 16, winningCircleDiameter / 2, playerTwoScore> 0 ? playerTwoCircleColor : unfilledCircleColor, unfilledCircleColor, false);
	draw_circle_color(room_width / 2 - 32, 16, winningCircleDiameter / 2, playerTwoScore> 1 ? playerTwoCircleColor : unfilledCircleColor, unfilledCircleColor, false);
	draw_circle_color(room_width / 2, 16, winningCircleDiameter / 2, winningCircleColor, winningCircleColor, false);
	draw_circle_color(room_width / 2 + 32, 16, winningCircleDiameter / 2, playerOneScore > 1 ? playerOneCircleColor : unfilledCircleColor, unfilledCircleColor, false);
	draw_circle_color(room_width / 2 + 64, 16, winningCircleDiameter / 2, playerOneScore > 0 ? playerOneCircleColor : unfilledCircleColor, unfilledCircleColor, false);

	if (lazerActive) {
		draw_set_color(c_red);
		var x1 = lazerHorizontal ? 0 : lazerPosition * 64 + 32;
		var y1 = lazerHorizontal ? lazerPosition * 64 + 32 : 32;
		var x2 = lazerHorizontal ? room_width : lazerPosition * 64 + 32;
		var y2 = lazerHorizontal ? lazerPosition * 64 + 32 : room_height - 32;
		draw_line(x1, y1, x2, y2);
	}

	// Beat Counter UI
	var squareCount = currentBeat % 4 + 1;
	var boxYPosition = room_height - 32;
	var boxWidth = room_width / 4;

	if (!gameOver) {
		for (var i = 0; i < squareCount; i++) {
			var color = squareCount == 4 ? c_yellow : c_green;
			var x1 = i * boxWidth;
			var x2 = (i + 1) * boxWidth;
			draw_rectangle_color(x1, boxYPosition, x2, room_height, color, color, color, color, false);
		}

		var textColor = c_white;
		draw_text_colour(0, 0, playerTwoObject.ammo, textColor, textColor, textColor, textColor, 1);
		draw_text_colour(room_width - 10, 0, playerOneObject.ammo, textColor, textColor, textColor, textColor, 1);	
	} else {
		var textColor = c_white;
		draw_text_colour(0, boxYPosition, "Winner, winner, chicken dinner", textColor, textColor, textColor, textColor, 1);
	}	
}


// Winner room

if (room == winner) {
	draw_text(85, 77, "P" + string(roundWinner));
	draw_text_ext(32, 236, prize, 16, 150);
}
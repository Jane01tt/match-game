function objective_solve(_type)
{
	with(obj_objectives) {
		if(type_0 == _type)
		{
			amount_0 += -1;
		}

		if(type_1 == _type)
		{
			amount_1 += -1;
		}

		if(type_2 == _type)
		{
			amount_2 += -1;
		}

		if(amount_0 <= 0 && amount_1 <= 0 && amount_2 <= 0)
		{
			var _game_over = instance_exists(obj_game_over_win);
			if(!_game_over)
			{
				// Create the Sequence which shows a window telling the user they have completed the level.
				if(room != room_last)
				{
					layer_sequence_create("UIElements1", room_width / 2, (room_height / 2) - 200, seq_game_over_win_level);
				}
				else
				{
					layer_sequence_create("UIElements1", room_width / 2, (room_height / 2) - 200, seq_game_over_win_template);
				}
			}
		}
	}
}
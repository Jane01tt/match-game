// Generate a new random seed so we definately don't get the same objectives between runs.
randomize();

// We have a different number and types of objectives for each level.
// So this switch statement separates those setups.
switch(room)
{
	// If we are setting objectives for level 1...
	case rm_level_1:
		// Set first objective type to 0, 1, 2 or 3.
		type_0 = irandom_range(0, 3);
	
		// Disable second objective.
		type_1 = -1;
	
		// Disable third objective.
		type_2 = -1;
	
		// Set objective amounts to values between 3 and 6.
		// Unless they're disabled, in which case just set to -1.
		amount_0 = irandom_range(3, 6);
		amount_1 = -1;
		amount_2 = -1;
		break;

	// If we are setting objectives for level 2...
	case rm_level_2:
		// Set first objective type to 0, 1, 2 or 3.
		type_0 = irandom_range(0, 3);
	
		// Set second objective type to 4 or 5.
		type_1 = irandom_range(4, 5);
	
		// Disable third objectibe.
		type_2 = -1;
	
		// Set objective amounts to values between 3 and 6.
		// Unless they're disabled, in which case just set to -1.
		amount_0 = irandom_range(3, 6);
		amount_1 = irandom_range(3, 6);
		amount_2 = -1;
		break;

	// If we are setting objectives for level 3...
	case rm_level_3:
		// Set first objective type to 0, 1, 2 or 3.
		type_0 = irandom_range(0, 3);
	
		// Set second objective type to 4 or 5.
		type_1 = irandom_range(4, 5);
	
		// Set third objective type to 6 or 7.
		type_2 = irandom_range(6, 7);
	
		// Set objective amounts to values between 3 and 6.
		// Level 3 has all objectives enabled, so there's nothing to disable here.
		amount_0 = irandom_range(3, 6);
		amount_1 = irandom_range(3, 6);
		amount_2 = irandom_range(3, 6);
		break;
}
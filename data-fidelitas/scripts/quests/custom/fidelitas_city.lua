local config = {
	boss = {
		name = "Valaraukar",
		position = Position(698, 783, 7)
	},
	requiredLevel = 50,
	playerPositions = {
		{ pos = Position(770, 708, 6), teleport = Position(698, 791, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(771, 708, 6), teleport = Position(698, 791, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(772, 708, 6), teleport = Position(698, 791, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(773, 708, 6), teleport = Position(698, 791, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(692, 781, 7),
		to = Position(704, 796, 7),
	},
	exit = Position(772, 706, 6),
}

local lever = BossLever(config)
lever:aid(55615)
lever:register()
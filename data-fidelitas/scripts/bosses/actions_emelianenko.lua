local config = {
	boss = {
		name = "Emelianenko",
		position = Position(899, 783, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("24h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(887, 779, 7), teleport = Position(904, 785, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(887, 780, 7), teleport = Position(904, 785, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(887, 781, 7), teleport = Position(904, 785, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(886, 780, 7), teleport = Position(904, 785, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(888, 780, 7), teleport = Position(904, 785, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(895, 774, 7),
		to = Position(914, 791, 7),
	},
	exit = Position(943, 795, 7),
}

local lever = BossLever(config)
lever:aid(58836)
lever:register()
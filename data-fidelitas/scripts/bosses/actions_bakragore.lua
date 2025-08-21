local config = {
	boss = {
		name = "Bakragore",
		position = Position(1029, 1162, 7),
	},
	requiredLevel = 400,
	timeToFightAgain = ParseDuration("68h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1060, 1162, 7), teleport = Position(1030, 1171, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1061, 1162, 7), teleport = Position(1030, 1171, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1062, 1162, 7), teleport = Position(1030, 1171, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1063, 1162, 7), teleport = Position(1030, 1171, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1064, 1162, 7), teleport = Position(1030, 1171, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1022, 1151, 7),
		to = Position(1037, 1172, 7),
	},
	exit = Position(1063, 1165, 7),
}

local lever = BossLever(config)
lever:position(Position(1065, 1162, 7))
lever:register()

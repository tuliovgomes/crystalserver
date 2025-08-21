local config = {
	boss = {
		name = "Vemiath",
		position = Position(1030, 1099, 7),
	},
	requiredLevel = 400,
	playerPositions = {
		{ pos = Position(1060, 1097, 7), teleport = Position(1026, 1103, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1061, 1097, 7), teleport = Position(1026, 1103, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1062, 1097, 7), teleport = Position(1026, 1103, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1063, 1097, 7), teleport = Position(1026, 1103, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1064, 1097, 7), teleport = Position(1026, 1103, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1019, 1089, 7),
		to = Position(1038, 1108, 7),
	},
	exit = Position(1061, 1099, 7),
}

local lever = BossLever(config)
lever:position(Position(1065, 1097, 7))
lever:register()

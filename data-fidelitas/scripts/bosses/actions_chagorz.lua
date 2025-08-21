local config = {
	boss = {
		name = "Chagorz",
		position = Position(1030, 1131, 7),
	},
	requiredLevel = 400,
	playerPositions = {
		{ pos = Position(1060, 1131, 7), teleport = Position(1030, 1136, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1061, 1131, 7), teleport = Position(1030, 1136, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1062, 1131, 7), teleport = Position(1030, 1136, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1063, 1131, 7), teleport = Position(1030, 1136, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1064, 1131, 7), teleport = Position(1030, 1136, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1020, 1122, 7),
		to = Position(1039, 1140, 7),
	},
	exit = Position(1060, 1134, 7),
}

local lever = BossLever(config)
lever:position(Position(1065, 1131, 7))
lever:register()

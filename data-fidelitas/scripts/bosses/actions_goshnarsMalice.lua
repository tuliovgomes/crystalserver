local config = {
	boss = {
		name = "Goshnar's Malice",
		position = Position(1127, 1105, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1097, 1105, 7), teleport = Position(1126, 1109, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1098, 1105, 7), teleport = Position(1126, 1109, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1099, 1105, 7), teleport = Position(1126, 1109, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1100, 1105, 7), teleport = Position(1126, 1109, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1101, 1105, 7), teleport = Position(1126, 1109, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1115, 1095, 7),
		to = Position(1137, 1114, 7),
	},
	exit = Position(1101, 1108, 7),
}

local lever = BossLever(config)
lever:position(Position(1096, 1105, 7))
lever:register()

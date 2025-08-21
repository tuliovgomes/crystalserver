local config = {
	boss = {
		name = "Goshnar's Cruelty",
		position = Position(1229, 1104, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1225, 1118, 7), teleport = Position(1227, 1108, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1226, 1118, 7), teleport = Position(1227, 1108, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1227, 1118, 7), teleport = Position(1227, 1108, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1228, 1118, 7), teleport = Position(1227, 1108, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1229, 1118, 7), teleport = Position(1227, 1108, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1216, 1095, 7),
		to = Position(1238, 1113, 7),
	},
	exit = Position(1232, 1118, 7),
}

local lever = BossLever(config)
lever:position(Position(1224, 1118, 7))
lever:register()
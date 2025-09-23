local config = {
	boss = {
		name = "The Time Guardian",
		position = Position(567, 1260, 7),
	},
	requiredLevel = 200,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(546, 1257, 7), teleport = Position(546, 1257, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1258, 7), teleport = Position(546, 1257, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1259, 7), teleport = Position(546, 1257, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1260, 7), teleport = Position(546, 1257, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1261, 7), teleport = Position(546, 1257, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(554, 1251, 7),
		to = Position(577, 1270, 7),
	},
	exit = Position(546, 1263, 7),
}

local lever = BossLever(config)
lever:position(Position(546, 1256, 7))
lever:register()

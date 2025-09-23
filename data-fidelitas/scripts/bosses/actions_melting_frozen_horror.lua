local config = {
	boss = {
		name = "Melting Frozen Horror",
		position = Position(568, 1309, 7),
	},
	requiredLevel = 200,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(546, 1304, 7), teleport = Position(568, 1314, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1305, 7), teleport = Position(568, 1314, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1306, 7), teleport = Position(568, 1314, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1307, 7), teleport = Position(568, 1314, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1308, 7), teleport = Position(568, 1314, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(555, 1299, 7),
		to = Position(579, 1319, 7),
	},
	exit = Position(545, 1310, 7),
}

local lever = BossLever(config)
lever:position(Position(546, 1303, 7))
lever:register()

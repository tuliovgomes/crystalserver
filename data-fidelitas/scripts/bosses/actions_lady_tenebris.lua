local config = {
	boss = {
		name = "Lady Tenebris",
		position = Position(567, 1282, 7),
	},
	requiredLevel = 200,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(546, 1277, 7), teleport = Position(567, 1284, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1278, 7), teleport = Position(567, 1284, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1279, 7), teleport = Position(567, 1284, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1280, 7), teleport = Position(567, 1284, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(546, 1281, 7), teleport = Position(567, 1284, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(558, 1271, 7),
		to = Position(578, 1292, 7),
	},
	exit = Position(546, 1282, 7),
}

local lever = BossLever(config)
lever:position(Position(546, 1276, 7))
lever:register()

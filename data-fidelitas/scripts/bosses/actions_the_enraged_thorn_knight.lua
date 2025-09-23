local config = {
	boss = {
		name = "The Enraged Thorn Knight",
		position = Position(508, 1282, 7),
	},
	requiredLevel = 200,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(529, 1283, 7), teleport = Position(508, 1283, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(529, 1284, 7), teleport = Position(508, 1283, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(529, 1285, 7), teleport = Position(508, 1283, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(529, 1286, 7), teleport = Position(508, 1283, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(529, 1287, 7), teleport = Position(508, 1283, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(498, 1271, 7),
		to = Position(518, 1291, 7),
	},
	exit = Position(529, 1290, 7),
}

local lever = BossLever(config)
lever:position(Position(529, 1282, 7))
lever:register()

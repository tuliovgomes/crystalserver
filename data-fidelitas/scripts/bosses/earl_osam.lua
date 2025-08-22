local config = {
	boss = {
		name = "Earl Osam",
		position = Position(1337, 1133, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1365, 1135, 7), teleport = Position(1337, 1129, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1366, 1135, 7), teleport = Position(1337, 1129, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1367, 1135, 7), teleport = Position(1337, 1129, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1368, 1135, 7), teleport = Position(1337, 1129, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1369, 1135, 7), teleport = Position(1337, 1129, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1326, 1120, 7),
		to = Position(1346, 1137, 7),
	},
	exit = Position(1366, 1131, 7),
}

local lever = BossLever(config)
lever:position(Position(1364, 1135, 7))
lever:register()

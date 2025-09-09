local config = {
	boss = {
		name = "Lokathmor",
		position = Position(1375, 211, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1345, 271, 7), teleport = Position(1375, 216, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1346, 271, 7), teleport = Position(1375, 216, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1347, 271, 7), teleport = Position(1375, 216, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1348, 271, 7), teleport = Position(1375, 216, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1349, 271, 7), teleport = Position(1375, 216, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1363, 202, 7),
		to = Position(1383, 220, 7),
	},
	exit = Position(1346, 273, 7),
}

local lever = BossLever(config)
lever:position(Position(1344, 271, 7))
lever:register()

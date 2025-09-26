local config = {
	boss = {
		name = "Lloyd",
		position = Position(510, 1315, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(530, 1306, 7), teleport = Position(510, 1318, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(530, 1307, 7), teleport = Position(510, 1318, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(530, 1308, 7), teleport = Position(510, 1318, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(530, 1309, 7), teleport = Position(510, 1318, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(530, 1310, 7), teleport = Position(510, 1318, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(495, 1299, 7),
		to = Position(523, 1325, 7),
	},
	exit = Position(530, 1313, 7),
}

local lever = BossLever(config)
lever:position(Position(530, 1305, 7))
lever:register()

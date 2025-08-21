local config = {
	boss = {
		name = "Urmahlullu the Immaculate",
		position = Position(935, 777, 9),
	},
	requiredLevel = 100,
	playerPositions = {
		{ pos = Position(899, 779, 9), teleport = Position(932, 771, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(900, 779, 9), teleport = Position(932, 771, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(901, 779, 9), teleport = Position(932, 771, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(902, 779, 9), teleport = Position(932, 771, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(903, 779, 9), teleport = Position(932, 771, 9), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(928, 766, 9),
		to = Position(943, 788, 9),
	},
	exit = Position(900, 776, 9),
}

local lever = BossLever(config)
lever:position(Position(903, 779, 9))
lever:register()

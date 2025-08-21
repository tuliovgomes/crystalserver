local config = {
	boss = {
		name = "Murcion",
		position = Position(994, 1131, 7),
	},
	requiredLevel = 400,
	playerPositions = {
		{ pos = Position(960, 1129, 7), teleport = Position(992, 1135, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(961, 1129, 7), teleport = Position(992, 1135, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(962, 1129, 7), teleport = Position(992, 1135, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(963, 1129, 7), teleport = Position(992, 1135, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(964, 1129, 7), teleport = Position(992, 1135, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(984, 1122, 7),
		to = Position(1004, 1139, 7),
	},
	exit = Position(963, 1131, 7),
}

local lever = BossLever(config)
lever:position(Position(965, 1129, 7))
lever:register()

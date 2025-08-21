local config = {
	boss = {
		name = "Ichgahal",
		position = Position(994, 1099, 7),
	},
	requiredLevel = 400,
	playerPositions = {
		{ pos = Position(960, 1097, 7), teleport = Position(993, 1105, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(961, 1097, 7), teleport = Position(993, 1105, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(962, 1097, 7), teleport = Position(993, 1105, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(963, 1097, 7), teleport = Position(993, 1105, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(964, 1097, 7), teleport = Position(993, 1105, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(983, 1089, 7),
		to = Position(1004, 1107, 7),
	},
	exit = Position(961, 1099, 7),
}

local lever = BossLever(config)
lever:position(Position(965, 1097, 7))
lever:register()

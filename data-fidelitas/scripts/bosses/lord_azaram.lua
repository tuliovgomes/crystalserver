local config = {
	boss = {
		name = "Lord Azaram",
		position = Position(1273, 1162, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1271, 1184, 7), teleport = Position(1273, 1166, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1272, 1184, 7), teleport = Position(1273, 1166, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1273, 1184, 7), teleport = Position(1273, 1166, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1274, 1184, 7), teleport = Position(1273, 1166, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1275, 1184, 7), teleport = Position(1273, 1166, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1264, 1154, 7),
		to = Position(1282, 1172, 7),
	},
	exit = Position(1273, 1187, 7),
}

local lever = BossLever(config)
lever:position(Position(1270, 1184, 7))
lever:register()

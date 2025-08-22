local config = {
	boss = {
		name = "Duke Krule",
		position = Position(1306, 1164, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1304, 1184, 7), teleport = Position(1305, 1170, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1305, 1184, 7), teleport = Position(1305, 1170, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1306, 1184, 7), teleport = Position(1305, 1170, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1307, 1184, 7), teleport = Position(1305, 1170, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1308, 1184, 7), teleport = Position(1305, 1170, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1295, 1152, 7),
		to = Position(1316, 1175, 7),
	},
	exit = Position(1305, 1188, 7),
}

local lever = BossLever(config)
lever:position(Position(1303, 1184, 7))
lever:register()

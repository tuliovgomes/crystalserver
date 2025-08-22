local config = {
	boss = { 
		name = "Timira the Many-Headed",
		position = Position(1400, 1124, 7)
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1391, 1143, 7), teleport = Position(1396, 1122, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1392, 1143, 7), teleport = Position(1396, 1122, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1393, 1143, 7), teleport = Position(1396, 1122, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1394, 1143, 7), teleport = Position(1396, 1122, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1395, 1143, 7), teleport = Position(1396, 1122, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1388, 1114, 7),
		to = Position(1406, 1131, 7),
	},
	exit = Position(1395, 1140, 7),
}

local lever = BossLever(config)
lever:position(Position(1396, 1143, 7))
lever:register()
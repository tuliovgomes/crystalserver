local config = {
	boss = {
		name = "Count Vlarkorth",
		position = Position(1305, 1128, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33455, 31413, 13), teleport = Position(1306, 1131, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(33456, 31413, 13), teleport = Position(1306, 1131, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(33457, 31413, 13), teleport = Position(1306, 1131, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(33458, 31413, 13), teleport = Position(1306, 1131, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(33459, 31413, 13), teleport = Position(1306, 1131, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1295, 1118, 7),
		to = Position(1313, 1138, 7),
	},
	exit = Position(1306, 1100, 7),
}

local lever = BossLever(config)
lever:position(Position(1303, 1104, 7))
lever:register()

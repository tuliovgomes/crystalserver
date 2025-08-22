local config = {
	boss = {
		name = "King Zelos",
		position = Position(1104, 207, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1102, 178, 7), teleport = Position(1104, 200, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1103, 178, 7), teleport = Position(1104, 200, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1104, 178, 7), teleport = Position(1104, 200, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1105, 178, 7), teleport = Position(1104, 200, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1106, 178, 7), teleport = Position(1104, 200, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1088, 193, 7),
		to = Position(1117, 220, 7),
	},
	exit = Position(1103, 184, 7),
}

local lever = BossLever(config)
lever:position(Position(1104, 177, 7))
lever:register()

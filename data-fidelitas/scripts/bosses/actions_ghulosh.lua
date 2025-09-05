local config = {
	boss = {
		name = "Ghulosh",
		position = Position(1380, 242, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1371, 295, 7), teleport = Position(1380, 246, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1372, 295, 7), teleport = Position(1380, 246, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1373, 295, 7), teleport = Position(1380, 246, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1374, 295, 7), teleport = Position(1380, 246, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1375, 295, 7), teleport = Position(1380, 246, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1370, 233, 7),
		to = Position(1387, 255, 7),
	},
	exit = Position(1373, 292, 7),
}

local lever = BossLever(config)
lever:position(Position(1370, 295, 7))
lever:register()

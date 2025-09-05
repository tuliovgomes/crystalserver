local config = {
	boss = {
		name = "Gorzindel",
		position = Position(1312, 240, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1371, 271, 7), teleport = Position(1312, 245, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1372, 271, 7), teleport = Position(1312, 245, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1373, 271, 7), teleport = Position(1312, 245, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1374, 271, 7), teleport = Position(1312, 245, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1375, 271, 7), teleport = Position(1312, 245, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1300, 229, 7),
		to = Position(1324, 253, 7),
	},
	exit = Position(1373, 269, 7),
}

local lever = BossLever(config)
lever:position(Position(1370, 271, 7))
lever:register()

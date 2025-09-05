local config = {
	boss = {
		name = "Mazzinor",
		position = Position(1348, 242, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1345, 295, 7), teleport = Position(1351, 245, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1346, 295, 7), teleport = Position(1351, 245, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1347, 295, 7), teleport = Position(1351, 245, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1348, 295, 7), teleport = Position(1351, 245, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1349, 295, 7), teleport = Position(1351, 245, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1337, 234, 7),
		to = Position(1358, 252, 7),
	},
	exit = Position(1347, 293, 7),
}

local lever = BossLever(config)
lever:position(Position(1344, 295, 7))
lever:register()

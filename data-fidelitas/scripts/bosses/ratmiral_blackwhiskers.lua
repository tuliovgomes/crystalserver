local config = {
	boss = {
		name = "Ratmiral Blackwhiskers",
		position = Position(1349, 1170, 6),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1338, 1206, 7), teleport = Position(1348, 1175, 6), effect = CONST_ME_TELEPORT },
		{ pos = Position(1339, 1206, 7), teleport = Position(1348, 1175, 6), effect = CONST_ME_TELEPORT },
		{ pos = Position(1340, 1206, 7), teleport = Position(1348, 1175, 6), effect = CONST_ME_TELEPORT },
		{ pos = Position(1341, 1206, 7), teleport = Position(1348, 1175, 6), effect = CONST_ME_TELEPORT },
		{ pos = Position(1342, 1206, 7), teleport = Position(1348, 1175, 6), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1340, 1160, 6),
		to = Position(1367, 1178, 6),
	},
	exit = Position(1344, 1206, 7),
}

local lever = BossLever(config)
lever:position(Position(1337, 1206, 7))
lever:register()

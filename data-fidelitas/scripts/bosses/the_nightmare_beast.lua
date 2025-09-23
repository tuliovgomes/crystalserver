local config = {
	boss = {
		name = "The Nightmare Beast",
		position = Position(417, 1191, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(445, 1174, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(446, 1174, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(447, 1174, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(448, 1174, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(449, 1174, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(445, 1175, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(446, 1175, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(447, 1175, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(448, 1175, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(449, 1175, 7), teleport = Position(422, 1194, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(405, 1183, 7),
		to = Position(431, 1203, 7),
	},
	exit = Position(447, 1177, 7),
}

local lever = BossLever(config)
lever:position(Position(447, 1173, 7))
lever:register()

local config = {
	boss = {
		name = "The Brainstealer",
		position = Position(419, 1137, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(451, 1130, 7), teleport = Position(420, 1143, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(452, 1130, 7), teleport = Position(420, 1143, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(453, 1130, 7), teleport = Position(420, 1143, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(454, 1130, 7), teleport = Position(420, 1143, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(455, 1130, 7), teleport = Position(420, 1143, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(408, 1132, 7),
		to = Position(427, 1148, 7),
	},
	exit = Position(451, 1132, 7),
}

local lever = BossLever(config)
lever:position(Position(450, 1130, 7))
lever:register()

local config = {
	boss = { 
		name = "Magma Bubble",
		position = Position(446, 1036, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(464, 1055, 7), teleport = Position(449, 1045, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(464, 1056, 7), teleport = Position(449, 1045, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(464, 1057, 7), teleport = Position(449, 1045, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(464, 1058, 7), teleport = Position(449, 1045, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(464, 1059, 7), teleport = Position(449, 1045, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(428, 1013, 7),
		to = Position(461, 1048, 7),
	},
	exit = Position(465, 1057, 7),
}

local lever = BossLever(config)
lever:position(Position(464, 1054, 7))
lever:register()

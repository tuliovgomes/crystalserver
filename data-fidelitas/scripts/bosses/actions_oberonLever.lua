local config = {
	boss = {
		name = "Grand Master Oberon",
		position = Position(619, 874, 8),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(616, 900, 8), teleport = Position(618, 878, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(617, 900, 8), teleport = Position(618, 878, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(618, 900, 8), teleport = Position(618, 878, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(619, 900, 8), teleport = Position(618, 878, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(620, 900, 8), teleport = Position(618, 878, 8), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(608, 866, 8),
		to = Position(629, 883, 8),
	},
	exit = Position(618, 897, 8),
}

local lever = BossLever(config)
lever:position(Position(618, 899, 8))
lever:register()

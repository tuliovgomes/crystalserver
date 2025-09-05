local config = {
	boss = {
		name = "Tentugly's Head",
		position = Position(983, 1039, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(984, 1045, 6), teleport = Position(982, 1043, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(985, 1045, 6), teleport = Position(982, 1043, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(986, 1045, 6), teleport = Position(982, 1043, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(987, 1045, 6), teleport = Position(982, 1043, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(988, 1045, 6), teleport = Position(982, 1043, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(964, 1033, 7),
		to = Position(999, 1048, 7),
	},
	exit = Position(984, 1043, 6),
}

local lever = BossLever(config)
lever:position(Position(983, 1045, 6))
lever:register()

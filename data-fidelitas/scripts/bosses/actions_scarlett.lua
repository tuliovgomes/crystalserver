local config = {
	boss = {
		name = "Scarlett Etzel",
		position = Position(905, 985, 6),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(904, 996, 6), teleport = Position(904, 991, 6), effect = CONST_ME_TELEPORT },
		{ pos = Position(904, 997, 6), teleport = Position(904, 991, 6), effect = CONST_ME_TELEPORT },
		{ pos = Position(904, 998, 6), teleport = Position(904, 991, 6), effect = CONST_ME_TELEPORT },
		{ pos = Position(903, 997, 6), teleport = Position(904, 991, 6), effect = CONST_ME_TELEPORT },
		{ pos = Position(905, 997, 6), teleport = Position(904, 991, 6), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(894, 971, 6),
		to = Position(915, 995, 6),
	},
	exit = Position(906, 996, 6),
}

local lever = BossLever(config)
lever:position(Position(904, 995, 6))
lever:register()

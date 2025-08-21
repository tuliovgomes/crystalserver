local config = {
	boss = {
		name = "Goshnar's Megalomania Purple",
		position = Position(1127, 1140, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1095, 1140, 7), teleport = Position(1128, 1147, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1096, 1140, 7), teleport = Position(1128, 1147, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1097, 1140, 7), teleport = Position(1128, 1147, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1098, 1140, 7), teleport = Position(1128, 1147, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1099, 1140, 7), teleport = Position(1128, 1147, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1119, 1131, 7),
		to = Position(1137, 1151, 7),
	},
	exit = Position(1094, 1137, 7),
}

local lever = BossLever(config)
lever:position(Position(1093, 1140, 7))
lever:register()

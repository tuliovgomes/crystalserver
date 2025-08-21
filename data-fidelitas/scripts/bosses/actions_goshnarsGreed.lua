local config = {
	boss = {
		name = "Goshnar's Greed",
		position = Position(1164, 1172, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1194, 1171, 7), teleport = Position(1165, 1177, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1195, 1171, 7), teleport = Position(1165, 1177, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1196, 1171, 7), teleport = Position(1165, 1177, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1197, 1171, 7), teleport = Position(1165, 1177, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1198, 1171, 7), teleport = Position(1165, 1177, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1155, 1163, 7),
		to = Position(1175, 1181, 7),
	},
	exit = Position(1194, 1173, 7),
}

local lever = BossLever(config)
lever:position(Position(1193, 1171, 7))
lever:register()

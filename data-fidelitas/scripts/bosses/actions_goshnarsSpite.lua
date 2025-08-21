local config = {
	boss = {
		name = "Goshnar's Spite",
		position = Position(1029, 1162, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1192, 1140, 7), teleport = Position(1160, 1143, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1193, 1140, 7), teleport = Position(1160, 1143, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1194, 1140, 7), teleport = Position(1160, 1143, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1195, 1140, 7), teleport = Position(1160, 1143, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1196, 1140, 7), teleport = Position(1160, 1143, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1150, 1130, 7),
		to = Position(1169, 1147, 7),
	},
	exit = Position(1193, 1142, 7),
}

local lever = BossLever(config)
lever:position(Position(1191, 1140, 7))
lever:register()

local config = {
	boss = {
		name = "Goshnar's Hatred",
		position = Position(1161, 1105, 7),
	},
	requiredLevel = 250,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1191, 1107, 7), teleport = Position(1163, 1109, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1192, 1107, 7), teleport = Position(1163, 1109, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1193, 1107, 7), teleport = Position(1163, 1109, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1194, 1107, 7), teleport = Position(1163, 1109, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(1195, 1107, 7), teleport = Position(1163, 1109, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1151, 1097, 7),
		to = Position(1170, 1114, 7),
	},
	exit = Position(1190, 1109, 7),
}

local lever = BossLever(config)
lever:position(Position(1190, 1107, 7))
lever:register()

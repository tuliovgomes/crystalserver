local config = {
	boss = {
		name = "Soul of Dragonking Zyrtarch",
		position = Position(508, 1255, 7),
	},
	requiredLevel = 200,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(528, 1261, 7), teleport = Position(508, 1258, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(528, 1262, 7), teleport = Position(508, 1258, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(528, 1263, 7), teleport = Position(508, 1258, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(528, 1264, 7), teleport = Position(508, 1258, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(528, 1265, 7), teleport = Position(508, 1258, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(496, 1246, 7),
		to = Position(518, 1265, 7),
	},
	exit = Position(528, 1267, 7),
}

local lever = BossLever(config)
lever:position(Position(528, 1260, 7))
lever:register()

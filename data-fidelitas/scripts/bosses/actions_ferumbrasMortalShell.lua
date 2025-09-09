local config = {
	boss = {
		name = "ferumbras mortal shell",
		position = Position(640, 913, 7),
	},
	requiredLevel = 500,
	timeToFightAgain = ParseDuration("48h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(677, 839, 6), teleport = Position(640, 903, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(678, 839, 6), teleport = Position(640, 903, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(679, 839, 6), teleport = Position(640, 903, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(680, 839, 6), teleport = Position(640, 903, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(681, 839, 6), teleport = Position(640, 903, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(625, 898, 7),
		to = Position(655, 927, 7),
	},
	exit = Position(679, 840, 6),
}

local lever = BossLever(config)
lever:position(Position(679, 838, 6))
lever:register()

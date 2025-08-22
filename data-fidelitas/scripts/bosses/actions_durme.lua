local config = {
	boss = {
		name = "Drume",
		position = Position(644, 562, 7),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(654, 558, 6), teleport = Position(645, 564, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(655, 558, 6), teleport = Position(645, 564, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(656, 558, 6), teleport = Position(645, 564, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(657, 558, 6), teleport = Position(645, 564, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(658, 558, 6), teleport = Position(645, 564, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(640, 562, 7),
		to = Position(654, 573, 7),
	},
	exit = Position(655, 557, 6),
}

local lever = BossLever(config)
lever:position(Position(653, 558, 6))
lever:register()

local config = {
	boss = { 
		name = "Frostagor",
		position = Position(782, 507, 8)
	},
	requiredLevel = 150,
	playerPositions = {
		{ pos = Position(730, 552, 7), teleport = Position(783, 500, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(731, 552, 7), teleport = Position(783, 500, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(732, 552, 7), teleport = Position(783, 500, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(733, 552, 7), teleport = Position(783, 500, 8), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(692, 781, 7),
		to = Position(704, 796, 7),
	},
	exit = Position(737, 552, 7),
}

local lever = BossLever(config)
lever:position(Position(731, 551, 7))
lever:register()
local config = {
	boss = {
		name = "Faceless Bane",
		position = Position(763, 878, 8),
	},
	requiredLevel = 250,
	timeToDefeat = 15 * 60,
	playerPositions = {
		{ pos = Position(789, 878, 8), teleport = Position(768, 883, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(790, 878, 8), teleport = Position(768, 883, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(791, 878, 8), teleport = Position(768, 883, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(792, 878, 8), teleport = Position(768, 883, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(793, 878, 8), teleport = Position(768, 883, 8), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(757, 869, 8),
		to = Position(779, 886, 8),
	},
	exit = Position(789, 880, 8),
}

local lever = BossLever(config)
lever:position(Position(788, 878, 8))
lever:register()

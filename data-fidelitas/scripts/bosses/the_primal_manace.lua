local config = {
	boss = {
		name = "The Primal Menace",
		position = Position(425, 1081, 7),
	},
	requiredLevel = 500,
	playerPositions = {
		{ pos = Position(460, 1089, 7), teleport = Position(430, 1083, 7) },
		{ pos = Position(461, 1089, 7), teleport = Position(430, 1083, 7) },
		{ pos = Position(462, 1089, 7), teleport = Position(430, 1083, 7) },
		{ pos = Position(463, 1089, 7), teleport = Position(430, 1083, 7) },
		{ pos = Position(464, 1089, 7), teleport = Position(430, 1083, 7) },
	},
	specPos = {
		from = Position(417, 1071, 7),
		to = Position(436, 1091, 7),
	},
	disableCooldown = false,
	exit = Position(466, 1089, 7),
}

lever = BossLever(config)
lever:position(Position(459, 1089, 7))
lever:register()

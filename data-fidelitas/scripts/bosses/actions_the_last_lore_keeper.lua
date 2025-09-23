local config = {
	boss = {
		name = "The Last Lore Keeper",
		position = Position(537, 1337, 7),
	},
	requiredLevel = 400,
	timeToFightAgain = ParseDuration("48h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(569, 1334, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(569, 1335, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(569, 1336, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(569, 1337, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(569, 1335, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(570, 1334, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(570, 1335, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(570, 1336, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(570, 1337, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(570, 1338, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(571, 1334, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(571, 1335, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(571, 1336, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(571, 1337, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(571, 1338, 7), teleport = Position(537, 1340, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(525, 1327, 7),
		to = Position(548, 1347, 7),
	},
	exit = Position(569, 1341, 7),
}

local lever = BossLever(config)
lever:position(Position(570, 1333, 7))
lever:register()

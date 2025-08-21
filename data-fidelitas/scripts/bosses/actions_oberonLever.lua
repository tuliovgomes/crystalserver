local config = {
	boss = {
		name = "Grand Master Oberon",
		createFunction = function()
			Game.createMonster("Grand Master Oberon", Position(618, 874, 8), true, true):setStorageValue(Storage.Quest.U11_80.TheSecretLibrary.FalconBastion.OberonHeal, 0)
			return true
		end,
	},
	timeToFightAgain = 20 * 60 * 60,
	playerPositions = {
		{ pos = Position(616, 900, 8), teleport = Position(618, 878, 8) },
		{ pos = Position(617, 900, 8), teleport = Position(618, 878, 8) },
		{ pos = Position(618, 900, 8), teleport = Position(618, 878, 8) },
		{ pos = Position(619, 900, 8), teleport = Position(618, 878, 8) },
		{ pos = Position(620, 900, 8), teleport = Position(618, 878, 8) },
	},
	specPos = {
		from = Position(609, 867, 8),
		to = Position(627, 883, 8),
	},
	exit = Position(33297, 31285, 9),
}

local leverOberon = BossLever(config)
leverOberon:aid(57605)
leverOberon:register()

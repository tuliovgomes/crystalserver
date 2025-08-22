local nictrosPosition = Position(1276, 1119, 7)
local baelocPosition = Position(1271, 1119, 7)

local config = {
	boss = {
		name = "Sir Nictros",
		createFunction = function()
			local nictros = Game.createMonster("Sir Nictros", nictrosPosition, true, true):registerEvent("SirNictrosThink")
			local baeloc = Game.createMonster("Sir Baeloc", baelocPosition, true, true):registerEvent("SirBaelocThink")
			return nictros and baeloc
		end,
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1273, 1104, 7), teleport = Position(1273, 1129, 7)	 },
		{ pos = Position(1274, 1104, 7), teleport = Position(1273, 1129, 7)	 },
		{ pos = Position(1275, 1104, 7), teleport = Position(1273, 1129, 7)	 },
		{ pos = Position(1276, 1104, 7), teleport = Position(1273, 1129, 7)	 },
		{ pos = Position(1277, 1104, 7), teleport = Position(1273, 1129, 7)	 },
	},
	specPos = {
		from = Position(33414, 31426, 13),
		to = Position(33433, 31449, 13),
	},
	onUseExtra = function(player)
		addEvent(function()
			local nictros = Tile(nictrosPosition):getTopCreature()
			if not nictros then
				return
			end
			nictros:teleportTo(Position(1276, 1126, 7))
		end, 5 * 1000)
	end,
	exit = Position(1273, 1101, 7),
}

local lever = BossLever(config)
lever:position(Position(1272, 1104, 7))
lever:register()

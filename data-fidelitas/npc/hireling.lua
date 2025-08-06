function createHirelingType(HirelingName)
	local npcType = Game.createNpcType(HirelingName)

	-- If it's a Hireling with a name like an npc, example "Hireling Crystal", we'll remove the name "Hireling" and keep only the npc name for the look description
	if string.match(HirelingName, "^Hireling%s%w+") then
		HirelingName = string.sub(HirelingName, 10)
	end

	local npcConfig = {}
	local enableBankSystem = {}

	npcConfig.name = HirelingName
	npcConfig.description = HirelingName

	npcConfig.health = 100
	npcConfig.maxHealth = npcConfig.health
	npcConfig.walkInterval = 0
	npcConfig.walkRadius = 2

	npcConfig.outfit = {
		lookType = 136,
		lookHead = 97,
		lookBody = 34,
		lookLegs = 3,
		lookFeet = 116,
		lookAddons = 0,
	}

	npcConfig.flags = {
		floorchange = false,
	}

	local itemsTable = {
		["various"] = {
			{ itemName = "blue footboard", clientId = 32482, buy = 40 },
			{ itemName = "blue headboard", clientId = 32473, buy = 40 },
			{ itemName = "cot footboard", clientId = 32486, buy = 40 },
			{ itemName = "cot headboard", clientId = 32477, buy = 40 },
			{ itemName = "green footboard", clientId = 32483, buy = 40 },
			{ itemName = "green headboard", clientId = 32474, buy = 40 },
			{ itemName = "hammock foot section", clientId = 32487, buy = 40 },
			{ itemName = "hammock head section", clientId = 32478, buy = 40 },
			{ itemName = "red footboard", clientId = 32484, buy = 40 },
			{ itemName = "red headboard", clientId = 32475, buy = 40 },
			{ itemName = "simple footboard", clientId = 32488, buy = 40 },
			{ itemName = "simple headboard", clientId = 32479, buy = 40 },
			{ itemName = "straw mat foot section", clientId = 32489, buy = 40 },
			{ itemName = "straw mat head section", clientId = 32480, buy = 40 },
			{ itemName = "yellow footboard", clientId = 32485, buy = 40 },
			{ itemName = "yellow headboard", clientId = 32476, buy = 40 },
			{ itemName = "amphora", clientId = 2893, buy = 4 },
			{ itemName = "armor rack kit", clientId = 6114, buy = 90 },
			{ itemName = "bamboo drawer kit", clientId = 2795, buy = 20 },
			{ itemName = "bamboo table kit", clientId = 2788, buy = 25 },
			{ itemName = "barrel kit", clientId = 2793, buy = 12 },
			{ itemName = "big table kit", clientId = 2785, buy = 30 },
			{ itemName = "birdcage kit", clientId = 2796, buy = 50 },
			{ itemName = "blue pillow", clientId = 2394, buy = 25 },
			{ itemName = "blue tapestry", clientId = 2659, buy = 25 },
			{ itemName = "bookcase kit", clientId = 6372, buy = 70 },
			{ itemName = "box", clientId = 2469, buy = 10 },
			{ itemName = "chest", clientId = 2472, buy = 10 },
			{ itemName = "chest of drawers", clientId = 2789, buy = 18 },
			{ itemName = "chimney kit", clientId = 7864, buy = 200 },
			{ itemName = "coal basin kit", clientId = 2806, buy = 25 },
			{ itemName = "cookie", clientId = 3598, buy = 2 },
			{ itemName = "crate", clientId = 2471, buy = 10 },
			{ itemName = "cuckoo clock", clientId = 2664, buy = 40 },
			{ itemName = "dresser kit", clientId = 2790, buy = 25 },
			{ itemName = "goldfish bowl", clientId = 5928, buy = 50 },
			{ itemName = "fireworks rocket", clientId = 6576, buy = 100 },
			{ itemName = "flower bowl", clientId = 2983, buy = 6 },
			{ itemName = "globe", clientId = 2797, buy = 50 },
			{ itemName = "goblin statue kit", clientId = 2804, buy = 50 },
			{ itemName = "god flowers", clientId = 2981, buy = 5 },
			{ itemName = "green balloons", clientId = 6577, buy = 500 },
			{ itemName = "green cushioned chair kit", clientId = 2776, buy = 40 },
			{ itemName = "green pillow", clientId = 2396, buy = 25 },
			{ itemName = "green tapestry", clientId = 2647, buy = 25 },
			{ itemName = "harp kit", clientId = 2808, buy = 50 },
			{ itemName = "heart pillow", clientId = 2393, buy = 30 },
			{ itemName = "honey flower", clientId = 2984, buy = 5 },
			{ itemName = "indoor plant kit", clientId = 2811, buy = 8 },
			{ itemName = "ivory chair kit", clientId = 2781, buy = 25 },
			{ itemName = "knight statue kit", clientId = 2802, buy = 50 },
			{ itemName = "large amphora kit", clientId = 2805, buy = 50 },
			{ itemName = "large trunk", clientId = 2794, buy = 10 },
			{ itemName = "locker kit", clientId = 2791, buy = 30 },
			{ itemName = "minotaur statue kit", clientId = 2803, buy = 50 },
			{ itemName = "orange tapestry", clientId = 2653, buy = 25 },
			{ itemName = "oven kit", clientId = 6371, buy = 80 },
			{ itemName = "party hat", clientId = 6578, buy = 800 },
			{ itemName = "party trumpet", clientId = 6572, buy = 500 },
			{ itemName = "pendulum clock kit", clientId = 2801, buy = 75 },
			{ itemName = "piano kit", clientId = 2807, buy = 200 },
			{ itemName = "potted flower", clientId = 2985, buy = 5 },
			{ itemName = "present", clientId = 2856, buy = 10 },
			{ itemName = "purple tapestry", clientId = 2644, buy = 25 },
			{ itemName = "red balloons", clientId = 6575, buy = 500 },
			{ itemName = "red cushioned chair kit", clientId = 2775, buy = 40 },
			{ itemName = "red pillow", clientId = 2395, buy = 25 },
			{ itemName = "red tapestry", clientId = 2656, buy = 25 },
			{ itemName = "rocking horse", clientId = 2800, buy = 30 },
			{ itemName = "round blue pillow", clientId = 2398, buy = 25 },
			{ itemName = "round purple pillow", clientId = 2400, buy = 25 },
			{ itemName = "round red pillow", clientId = 2399, buy = 25 },
			{ itemName = "round turquoise pillow", clientId = 2401, buy = 25 },
			{ itemName = "small blue pillow", clientId = 2389, buy = 20 },
			{ itemName = "small green pillow", clientId = 2387, buy = 20 },
			{ itemName = "small ice statue", clientId = 7447, buy = 50 },
			{ itemName = "small ice statue", clientId = 7448, buy = 50 },
			{ itemName = "small orange pillow", clientId = 2390, buy = 20 },
			{ itemName = "small purple pillow", clientId = 2386, buy = 20 },
			{ itemName = "small red pillow", clientId = 2388, buy = 20 },
			{ itemName = "small round table", clientId = 2783, buy = 25 },
			{ itemName = "small table kit", clientId = 2782, buy = 20 },
			{ itemName = "small trunk", clientId = 2426, buy = 20 },
			{ itemName = "small turquoise pillow", clientId = 2391, buy = 20 },
			{ itemName = "small white pillow", clientId = 2392, buy = 20 },
			{ itemName = "sofa chair kit", clientId = 2779, buy = 55 },
			{ itemName = "square table kit", clientId = 2784, buy = 25 },
			{ itemName = "stone table kit", clientId = 2786, buy = 30 },
			{ itemName = "table lamp kit", clientId = 2798, buy = 35 },
			{ itemName = "telescope kit", clientId = 2799, buy = 70 },
			{ itemName = "thick trunk", clientId = 2352, buy = 20 },
			{ itemName = "treasure chest", clientId = 2478, buy = 1000 },
			{ itemName = "trophy stand", clientId = 872, buy = 50 },
			{ itemName = "trough kit", clientId = 2792, buy = 7 },
			{ itemName = "tusk chair kit", clientId = 2780, buy = 25 },
			{ itemName = "tusk table kit", clientId = 2787, buy = 25 },
			{ itemName = "vase", clientId = 2876, buy = 3 },
			{ itemName = "venorean cabinet", clientId = 17974, buy = 90 },
			{ itemName = "venorean drawer", clientId = 17977, buy = 40 },
			{ itemName = "venorean wardrobe", clientId = 17975, buy = 50 },
			{ itemName = "wall mirror", clientId = 2638, buy = 40 },
			{ itemName = "wall mirror", clientId = 2635, buy = 40 },
			{ itemName = "wall mirror", clientId = 2632, buy = 40 },
			{ itemName = "water pipe", clientId = 2980, buy = 40 },
			{ itemName = "weapon rack kit", clientId = 6115, buy = 90 },
			{ itemName = "white tapestry", clientId = 2667, buy = 25 },
			{ itemName = "wooden chair kit", clientId = 2777, buy = 15 },
			{ itemName = "yellow pillow", clientId = 900, buy = 25 },
			{ itemName = "yellow tapestry", clientId = 2650, buy = 25 },
		},
		["exercise weapons"] = {
			{ itemName = "exercise axe", clientId = 28553, buy = 347222, subType = 500 },
			{ itemName = "exercise bow", clientId = 28555, buy = 347222, subType = 500 },
			{ itemName = "exercise club", clientId = 28554, buy = 347222, subType = 500 },
			{ itemName = "exercise rod", clientId = 28556, buy = 347222, subType = 500 },
			{ itemName = "exercise sword", clientId = 28552, buy = 347222, subType = 500 },
			{ itemName = "exercise wand", clientId = 28557, buy = 347222, subType = 500 },
			{ itemName = "durable exercise axe", clientId = 35280, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise bow", clientId = 35282, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise club", clientId = 35281, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise rod", clientId = 35283, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise sword", clientId = 35279, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise wand", clientId = 35284, buy = 1250000, subType = 1800 },
			{ itemName = "lasting exercise axe", clientId = 35286, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise bow", clientId = 35288, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise club", clientId = 35287, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise rod", clientId = 35289, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise sword", clientId = 35285, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise wand", clientId = 35290, buy = 10000000, subType = 14400 },
		},
		["equipment"] = {
			{ itemName = "axe", clientId = 3274, buy = 20, sell = 7 },
			{ itemName = "battle axe", clientId = 3266, buy = 235, sell = 80 },
			{ itemName = "battle hammer", clientId = 3305, buy = 350, sell = 120 },
			{ itemName = "bone sword", clientId = 3338, buy = 75, sell = 20 },
			{ itemName = "brass armor", clientId = 3359, buy = 450, sell = 150 },
			{ itemName = "brass helmet", clientId = 3354, buy = 120, sell = 30 },
			{ itemName = "brass legs", clientId = 3372, buy = 195, sell = 49 },
			{ itemName = "brass shield", clientId = 3411, buy = 65, sell = 25 },
			{ itemName = "carlin sword", clientId = 3283, buy = 473, sell = 118 },
			{ itemName = "chain armor", clientId = 3358, buy = 200, sell = 70 },
			{ itemName = "chain helmet", clientId = 3352, buy = 52, sell = 17 },
			{ itemName = "chain legs", clientId = 3558, buy = 80, sell = 25 },
			{ itemName = "club", clientId = 3270, buy = 5, sell = 1 },
			{ itemName = "coat", clientId = 3562, buy = 8, sell = 1 },
			{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
			{ itemName = "dagger", clientId = 3267, buy = 5, sell = 2 },
			{ itemName = "doublet", clientId = 3379, buy = 16, sell = 3 },
			{ itemName = "dwarven shield", clientId = 3425, buy = 500, sell = 100 },
			{ itemName = "hand axe", clientId = 3268, buy = 8, sell = 4 },
			{ itemName = "iron helmet", clientId = 3353, buy = 390, sell = 150 },
			{ itemName = "jacket", clientId = 3561, buy = 12, sell = 1 },
			{ itemName = "leather armor", clientId = 3361, buy = 35, sell = 12 },
			{ itemName = "leather boots", clientId = 3552, buy = 10, sell = 2 },
			{ itemName = "leather helmet", clientId = 3355, buy = 12, sell = 4 },
			{ itemName = "leather legs", clientId = 3559, buy = 10, sell = 9 },
			{ itemName = "longsword", clientId = 3285, buy = 160, sell = 51 },
			{ itemName = "mace", clientId = 3286, buy = 90, sell = 30 },
			{ itemName = "morning star", clientId = 3282, buy = 430, sell = 100 },
			{ itemName = "plate armor", clientId = 3357, buy = 1200, sell = 400 },
			{ itemName = "plate shield", clientId = 3410, buy = 125, sell = 45 },
			{ itemName = "rapier", clientId = 3272, buy = 15, sell = 5 },
			{ itemName = "sabre", clientId = 3273, buy = 35, sell = 12 },
			{ itemName = "scale armor", clientId = 3377, buy = 260, sell = 75 },
			{ itemName = "short sword", clientId = 3294, buy = 26, sell = 10 },
			{ itemName = "sickle", clientId = 3293, buy = 7, sell = 3 },
			{ itemName = "soldier helmet", clientId = 3375, buy = 110, sell = 16 },
			{ itemName = "spike sword", clientId = 3271, buy = 8000, sell = 240 },
			{ itemName = "steel helmet", clientId = 3351, buy = 580, sell = 293 },
			{ itemName = "steel shield", clientId = 3409, buy = 240, sell = 80 },
			{ itemName = "studded armor", clientId = 3378, buy = 90, sell = 25 },
			{ itemName = "studded helmet", clientId = 3376, buy = 63, sell = 20 },
			{ itemName = "studded legs", clientId = 3362, buy = 50, sell = 15 },
			{ itemName = "studded shield", clientId = 3426, buy = 50, sell = 16 },
			{ itemName = "sword", clientId = 3264, buy = 85, sell = 25 },
			{ itemName = "throwing knife", clientId = 3298, buy = 25, sell = 2 },
			{ itemName = "two handed sword", clientId = 3265, buy = 950, sell = 450 },
			{ itemName = "viking helmet", clientId = 3367, buy = 265, sell = 66 },
			{ itemName = "viking shield", clientId = 3431, buy = 260, sell = 85 },
			{ itemName = "war hammer", clientId = 3279, buy = 10000, sell = 470 },
			{ itemName = "wooden shield", clientId = 3412, buy = 15, sell = 5 },
		},
		["distance"] = {
			{ itemName = "arrow", clientId = 3447, buy = 2 },
			{ itemName = "bolt", clientId = 3446, buy = 4 },
			{ itemName = "bow", clientId = 3350, buy = 400, sell = 100 },
			{ itemName = "crossbow", clientId = 3349, buy = 500, sell = 120 },
			{ itemName = "crystalline arrow", clientId = 15793, buy = 450 },
			{ itemName = "drill bolt", clientId = 16142, buy = 12 },
			{ itemName = "diamond arrow", clientId = 35901, buy = 130 },
			{ itemName = "earth arrow", clientId = 774, buy = 5 },
			{ itemName = "envenomed arrow", clientId = 16143, buy = 12 },
			{ itemName = "flaming arrow", clientId = 763, buy = 5 },
			{ itemName = "flash arrow", clientId = 761, buy = 5 },
			{ itemName = "onyx arrow", clientId = 7365, buy = 7 },
			{ itemName = "piercing bolt", clientId = 7363, buy = 5 },
			{ itemName = "power bolt", clientId = 3450, buy = 7 },
			{ itemName = "prismatic bolt", clientId = 16141, buy = 20 },
			{ itemName = "quiver", clientId = 35562, buy = 400 },
			{ itemName = "royal spear", clientId = 7378, buy = 15 },
			{ itemName = "shiver arrow", clientId = 762, buy = 5 },
			{ itemName = "sniper arrow", clientId = 7364, buy = 5 },
			{ itemName = "spear", clientId = 3277, buy = 9, sell = 3 },
			{ itemName = "spectral bolt", clientId = 35902, buy = 70 },
			{ itemName = "tarsal arrow", clientId = 14251, buy = 6 },
			{ itemName = "throwing star", clientId = 3287, buy = 42 },
			{ itemName = "vortex bolt", clientId = 14252, buy = 6 },
		},
		["rods"] = {
			{ itemName = "exercise rod", clientId = 28556, buy = 236250, subType = 500 },
			{ itemName = "hailstorm rod", clientId = 3067, buy = 15000 },
			{ itemName = "moonlight rod", clientId = 3070, buy = 1000 },
			{ itemName = "necrotic rod", clientId = 3069, buy = 5000 },
			{ itemName = "northwind rod", clientId = 8083, buy = 7500 },
			{ itemName = "snakebite rod", clientId = 3066, buy = 500 },
			{ itemName = "springsprout rod", clientId = 8084, buy = 18000 },
			{ itemName = "terra rod", clientId = 3065, buy = 10000 },
			{ itemName = "underworld rod", clientId = 8082, buy = 22000 },
		},
		["wands"] = {
			{ itemName = "exercise wand", clientId = 28557, buy = 236250, subType = 500 },
			{ itemName = "wand of cosmic energy", clientId = 3073, buy = 10000 },
			{ itemName = "wand of decay", clientId = 3072, buy = 5000 },
			{ itemName = "wand of draconia", clientId = 8093, buy = 7500 },
			{ itemName = "wand of dragonbreath", clientId = 3075, buy = 1000 },
			{ itemName = "wand of inferno", clientId = 3071, buy = 15000 },
			{ itemName = "wand of starstorm", clientId = 8092, buy = 18000 },
			{ itemName = "wand of voodoo", clientId = 8094, buy = 22000 },
			{ itemName = "wand of vortex", clientId = 3074, buy = 500 },
		},
		["potions"] = {
			{ itemName = "great health potion", clientId = 239, buy = 225 },
			{ itemName = "great mana potion", clientId = 238, buy = 158 },
			{ itemName = "great spirit potion", clientId = 7642, buy = 254 },
			{ itemName = "health potion", clientId = 266, buy = 50 },
			{ itemName = "mana potion", clientId = 268, buy = 56 },
			{ itemName = "strong health potion", clientId = 236, buy = 115 },
			{ itemName = "strong mana potion", clientId = 237, buy = 108 },
			{ itemName = "supreme health potion", clientId = 23375, buy = 650 },
			{ itemName = "ultimate health potion", clientId = 7643, buy = 379 },
			{ itemName = "ultimate mana potion", clientId = 23373, buy = 488 },
			{ itemName = "ultimate spirit potion", clientId = 23374, buy = 488 },
			{ itemName = "empty potion flask", clientId = 283, sell = 5 },
			{ itemName = "empty potion flask", clientId = 284, sell = 5 },
			{ itemName = "empty potion flask", clientId = 285, sell = 5 },
			{ itemName = "vial", clientId = 2874, sell = 5 },
		},
		["runes"] = {
			{ itemName = "animate dead rune", clientId = 3203, buy = 375 },
			{ itemName = "avalanche rune", clientId = 3161, buy = 64 },
			{ itemName = "blank rune", clientId = 3147, buy = 10 },
			{ itemName = "chameleon rune", clientId = 3178, buy = 210 },
			{ itemName = "convince creature rune", clientId = 3177, buy = 80 },
			{ itemName = "cure poison rune", clientId = 3153, buy = 65 },
			{ itemName = "destroy field rune", clientId = 3148, buy = 15 },
			{ itemName = "disintegrate rune", clientId = 3197, buy = 26 },
			{ itemName = "energy bomb rune", clientId = 3149, buy = 203 },
			{ itemName = "energy field rune", clientId = 3164, buy = 38 },
			{ itemName = "energy wall rune", clientId = 3166, buy = 85 },
			{ itemName = "explosion rune", clientId = 3200, buy = 31 },
			{ itemName = "fire bomb rune", clientId = 3192, buy = 147 },
			{ itemName = "fire field rune", clientId = 3188, buy = 28 },
			{ itemName = "fire wall rune", clientId = 3190, buy = 61 },
			{ itemName = "fireball rune", clientId = 3189, buy = 30 },
			{ itemName = "great fireball rune", clientId = 3191, buy = 64 },
			{ itemName = "heavy magic missile rune", clientId = 3198, buy = 12 },
			{ itemName = "holy missile rune", clientId = 3182, buy = 16 },
			{ itemName = "icicle rune", clientId = 3158, buy = 30 },
			{ itemName = "intense healing rune", clientId = 3152, buy = 95 },
			{ itemName = "light magic missile rune", clientId = 3174, buy = 4 },
			{ itemName = "magic wall rune", clientId = 3180, buy = 116 },
			{ itemName = "paralyse rune", clientId = 3165, buy = 700 },
			{ itemName = "poison bomb rune", clientId = 3173, buy = 85 },
			{ itemName = "poison field rune", clientId = 3172, buy = 21 },
			{ itemName = "poison wall rune", clientId = 3176, buy = 52 },
			{ itemName = "soulfire rune", clientId = 3195, buy = 46 },
			{ itemName = "stalagmite rune", clientId = 3179, buy = 12 },
			{ itemName = "stone shower rune", clientId = 3175, buy = 41 },
			{ itemName = "sudden death rune", clientId = 3155, buy = 162 },
			{ itemName = "thunderstorm rune", clientId = 3202, buy = 52 },
			{ itemName = "ultimate healing rune", clientId = 3160, buy = 175 },
			{ itemName = "wild growth rune", clientId = 3156, buy = 160 },
		},
		["supplies"] = {
			{ itemName = "brown mushroom", clientId = 3725, buy = 10 },
			{ itemName = "ham", clientId = 3582, buy = 10 },
			{ itemName = "meat", clientId = 3577, buy = 5 },
			{ itemName = "shapeshifter ring", clientId = 907, buy = 5500, subType = 15 },
		},
		["tools"] = {
			{ itemName = "basket", clientId = 2855, buy = 6 },
			{ itemName = "bottle", clientId = 2875, buy = 3 },
			{ itemName = "bucket", clientId = 2873, buy = 4 },
			{ itemName = "candelabrum", clientId = 2911, buy = 8 },
			{ itemName = "candlestick", clientId = 2917, buy = 2 },
			{ itemName = "closed trap", clientId = 3481, buy = 280, sell = 75 },
			{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
			{ itemName = "fishing rod", clientId = 3483, buy = 150, sell = 40 },
			{ itemName = "machete", clientId = 3308, buy = 35, sell = 6 },
			{ itemName = "pick", clientId = 3456, buy = 50, sell = 15 },
			{ itemName = "rope", clientId = 3003, buy = 50, sell = 15 },
			{ itemName = "scythe", clientId = 3453, buy = 50, sell = 10 },
			{ itemName = "shovel", clientId = 3457, buy = 50, sell = 8 },
			{ itemName = "spellwand", clientId = 651, sell = 299 },
			{ itemName = "torch", clientId = 2920, buy = 2 },
			{ itemName = "watch", clientId = 2906, buy = 20, sell = 6 },
			{ itemName = "worm", clientId = 3492, buy = 1 },
			{ itemName = "spellwand", clientId = 651, sell = 299 },
		},
		["postal"] = {
			{ itemName = "label", clientId = 3507, buy = 1 },
			{ itemName = "letter", clientId = 3505, buy = 8 },
			{ itemName = "parcel", clientId = 3503, buy = 15 },
		},
		["buy loot"] = {
			-- Sell all loot in loot pouch
			{ itemName = "talon", clientId = 3034, sell = 320 },
			{ itemName = "all loot", clientId = 23721, sell = 1 },

			-- Alaistar
			{ itemName = "cowbell", clientId = 21204, sell = 210 },
			{ itemName = "execowtioner mask", clientId = 21201, sell = 240 },
			{ itemName = "giant pacifier", clientId = 21199, sell = 170 },
			{ itemName = "glob of glooth", clientId = 21182, sell = 125 },
			{ itemName = "glooth injection tube", clientId = 21103, sell = 350 },
			{ itemName = "metal jaw", clientId = 21193, sell = 260 },
			{ itemName = "metal toe", clientId = 21198, sell = 430 },
			{ itemName = "mooh'tah shell", clientId = 21202, sell = 110 },
			{ itemName = "moohtant horn", clientId = 21200, sell = 140 },
			{ itemName = "necromantic rust", clientId = 21196, sell = 390 },
			{ itemName = "poisoned fang", clientId = 21195, sell = 130 },
			{ itemName = "seacrest hair", clientId = 21801, sell = 260 },
			{ itemName = "seacrest pearl", clientId = 21747, sell = 400 },
			{ itemName = "seacrest scale", clientId = 21800, sell = 150 },
			{ itemName = "slime heart", clientId = 21194, sell = 160 },
			{ itemName = "slimy leaf tentacle", clientId = 21197, sell = 320 },

			-- Alesar
			{ itemName = "serpent sword", clientId = 3297, sell = 6000 },
			{ itemName = "black shield", clientId = 3429, sell = 800 },
			{ itemName = "bonebreaker", clientId = 7428, sell = 10000 },
			{ itemName = "dragon hammer", clientId = 3322, sell = 2000 },
			{ itemName = "dreaded cleaver", clientId = 7419, sell = 15000 },
			{ itemName = "giant sword", clientId = 3281, sell = 17000 },
			{ itemName = "haunted blade", clientId = 7407, sell = 8000 },
			{ itemName = "knight armor", clientId = 3370, sell = 5000 },
			{ itemName = "knight axe", clientId = 3318, sell = 2000 },
			{ itemName = "knight legs", clientId = 3371, sell = 5000 },
			{ itemName = "mystic turban", clientId = 3574, sell = 150 },
			{ itemName = "onyx flail", clientId = 7421, sell = 22000 },
			{ itemName = "ornamented axe", clientId = 7411, sell = 20000 },
			{ itemName = "poison dagger", clientId = 3299, sell = 50 },
			{ itemName = "scimitar", clientId = 3307, sell = 150 },
			{ itemName = "skull staff", clientId = 3324, sell = 6000 },
			{ itemName = "strange helmet", clientId = 3373, sell = 500 },
			{ itemName = "titan axe", clientId = 7413, sell = 4000 },
			{ itemName = "tower shield", clientId = 3428, sell = 8000 },
			{ itemName = "vampire shield", clientId = 3434, sell = 15000 },
			{ itemName = "warrior helmet", clientId = 3369, sell = 5000 },

			-- Haroun
			{ itemName = "axe ring", clientId = 3092, sell = 100 },
			{ itemName = "bronze amulet", clientId = 3056, sell = 50, count = 200 },
			{ itemName = "club ring", clientId = 3093, sell = 100 },
			{ itemName = "elven amulet", clientId = 3082, sell = 100, count = 50 },
			{ itemName = "garlic necklace", clientId = 3083, sell = 50 },
			{ itemName = "life crystal", clientId = 4840, sell = 50 },
			{ itemName = "magic light wand", clientId = 3046, sell = 35 },
			{ itemName = "mind stone", clientId = 3062, sell = 100 },
			{ itemName = "orb", clientId = 3060, sell = 750 },
			{ itemName = "power ring", clientId = 3050, sell = 50 },
			{ itemName = "stealth ring", clientId = 3049, sell = 200 },
			{ itemName = "stone skin amulet", clientId = 3081, sell = 500, count = 5 },
			{ itemName = "sword ring", clientId = 3091, sell = 100 },
			{ itemName = "wand of cosmic energy", clientId = 3073, sell = 2000 },
			{ itemName = "wand of decay", clientId = 3072, sell = 1000 },
			{ itemName = "wand of defiance", clientId = 16096, sell = 6500 },
			{ itemName = "wand of draconia", clientId = 8093, sell = 1500 },
			{ itemName = "wand of dragonbreath", clientId = 3075, sell = 200 },
			{ itemName = "wand of everblazing", clientId = 16115, sell = 6000 },
			{ itemName = "wand of inferno", clientId = 3071, sell = 3000 },
			{ itemName = "wand of starstorm", clientId = 8092, sell = 3600 },
			{ itemName = "wand of voodoo", clientId = 8094, sell = 4400 },
			{ itemName = "wand of vortex", clientId = 3074, sell = 100 },

			-- flint
			{ itemName = "crest of the deep seas", clientId = 21892, sell = 10000 },
			{ itemName = "cowtana", clientId = 21177, sell = 2500 },
			{ itemName = "gearwheel chain", clientId = 21170, sell = 5000 },
			{ itemName = "glooth amulet", clientId = 21183, sell = 2000 },
			{ itemName = "glooth axe", clientId = 21180, sell = 1500 },
			{ itemName = "glooth blade", clientId = 21179, sell = 1500 },
			{ itemName = "glooth cap", clientId = 21164, sell = 7000 },
			{ itemName = "glooth club", clientId = 21178, sell = 1500 },
			{ itemName = "glooth whip", clientId = 21172, sell = 2500 },
			{ itemName = "mooh'tah plate", clientId = 21166, sell = 6000 },
			{ itemName = "moohtant cudgel", clientId = 21173, sell = 14000 },
			{ itemName = "metal bat", clientId = 21171, sell = 9000 },
			{ itemName = "metal spats", clientId = 21169, sell = 2000 },
			{ itemName = "mino lance", clientId = 21174, sell = 7000 },
			{ itemName = "mino shield", clientId = 21175, sell = 3000 },
			{ itemName = "rubber cap", clientId = 21165, sell = 11000 },
			{ itemName = "heat core", clientId = 21167, sell = 10000 },
			{ itemName = "alloy legs", clientId = 21168, sell = 11000 },
			{ itemName = "execowtioner axe", clientId = 21176, sell = 12000 },

			-- nah'bob
			{ itemName = "angelic axe", clientId = 7436, sell = 5000 },
			{ itemName = "blue robe", clientId = 3567, sell = 10000 },
			{ itemName = "bonelord shield", clientId = 3418, sell = 1200 },
			{ itemName = "boots of haste", clientId = 3079, sell = 30000 },
			{ itemName = "broadsword", clientId = 3301, sell = 500 },
			{ itemName = "butcher's axe", clientId = 7412, sell = 18000 },
			{ itemName = "crown armor", clientId = 3381, sell = 12000 },
			{ itemName = "crown helmet", clientId = 3385, sell = 2500 },
			{ itemName = "crown legs", clientId = 3382, sell = 12000 },
			{ itemName = "crown shield", clientId = 3419, sell = 8000 },
			{ itemName = "crusader helmet", clientId = 3391, sell = 6000 },
			{ itemName = "dragon lance", clientId = 3302, sell = 9000 },
			{ itemName = "dragon shield", clientId = 3416, sell = 4000 },
			{ itemName = "fire axe", clientId = 3320, sell = 8000 },
			{ itemName = "glorious axe", clientId = 7454, sell = 3000 },
			{ itemName = "guardian shield", clientId = 3415, sell = 2000 },
			{ itemName = "ice rapier", clientId = 3284, sell = 1000 },
			{ itemName = "noble armor", clientId = 3380, sell = 900 },
			{ itemName = "obsidian lance", clientId = 3313, sell = 500 },
			{ itemName = "phoenix shield", clientId = 3439, sell = 16000 },
			{ itemName = "queen's sceptre", clientId = 7410, sell = 20000 },
			{ itemName = "royal helmet", clientId = 3392, sell = 30000 },
			{ itemName = "shadow sceptre", clientId = 7451, sell = 10000 },
			{ itemName = "thaian sword", clientId = 7391, sell = 16000 },
			{ itemName = "war hammer", clientId = 3279, sell = 1200 },

			-- yaman
			{ itemName = "ankh", clientId = 3077, sell = 100 },
			{ itemName = "dragon necklace", clientId = 3085, sell = 100, count = 200 },
			{ itemName = "dwarven ring", clientId = 3097, sell = 100 },
			{ itemName = "energy ring", clientId = 3051, sell = 100 },
			{ itemName = "glacial rod", clientId = 16118, sell = 6500 },
			{ itemName = "hailstorm rod", clientId = 3067, sell = 3000 },
			{ itemName = "life ring", clientId = 3052, sell = 50 },
			{ itemName = "might ring", clientId = 3048, sell = 250, count = 20 },
			{ itemName = "moonlight rod", clientId = 3070, sell = 200 },
			{ itemName = "muck rod", clientId = 16117, sell = 6000 },
			{ itemName = "mysterious fetish", clientId = 3078, sell = 50 },
			{ itemName = "necrotic rod", clientId = 3069, sell = 1000 },
			{ itemName = "northwind rod", clientId = 8083, sell = 1500 },
			{ itemName = "protection amulet", clientId = 3084, sell = 100, count = 250 },
			{ itemName = "ring of healing", clientId = 3098, sell = 100 },
			{ itemName = "silver amulet", clientId = 3054, sell = 50, count = 200 },
			{ itemName = "snakebite rod", clientId = 3066, sell = 100 },
			{ itemName = "springsprout rod", clientId = 8084, sell = 3600 },
			{ itemName = "strange talisman", clientId = 3045, sell = 30, count = 200 },
			{ itemName = "terra rod", clientId = 3065, sell = 2000 },
			{ itemName = "time ring", clientId = 3053, sell = 100 },
			{ itemName = "underworld rod", clientId = 8082, sell = 4400 },

			-- talila
			{ itemName = "butterfly ring", clientId = 25698, sell = 2000 },
			{ itemName = "heavy blossom staff", clientId = 25700, sell = 5000 },
			{ itemName = "wooden spellbook", clientId = 25699, sell = 12000 },
			{ itemName = "wood cape", clientId = 3575, sell = 5000 },

			-- esrik
			{ itemName = "club", clientId = 3270, sell = 1 },
			{ itemName = "coat", clientId = 3562, sell = 1 },
			{ itemName = "jacket", clientId = 3561, sell = 1 },
			{ itemName = "dagger", clientId = 3267, sell = 2 },
			{ itemName = "leather boots", clientId = 3552, sell = 2 },
			{ itemName = "throwing knife", clientId = 3298, sell = 2 },
			{ itemName = "doublet", clientId = 3379, sell = 3 },
			{ itemName = "sickle", clientId = 3293, sell = 3 },
			{ itemName = "hand axe", clientId = 3268, sell = 4 },
			{ itemName = "leather helmet", clientId = 3355, sell = 4 },
			{ itemName = "bone club", clientId = 3337, sell = 5 },
			{ itemName = "rapier", clientId = 3272, sell = 5 },
			{ itemName = "small axe", clientId = 3462, sell = 5 },
			{ itemName = "wooden shield", clientId = 3412, sell = 5 },
			{ itemName = "axe", clientId = 3274, sell = 7 },
			{ itemName = "leather legs", clientId = 3559, sell = 9 },
			{ itemName = "short sword", clientId = 3294, sell = 10 },
			{ itemName = "studded club", clientId = 3336, sell = 10 },
			{ itemName = "leather armor", clientId = 3361, sell = 12 },
			{ itemName = "sabre", clientId = 3273, sell = 12 },
			{ itemName = "studded legs", clientId = 3362, sell = 15 },
			{ itemName = "soldier helmet", clientId = 3375, sell = 16 },
			{ itemName = "studded shield", clientId = 3426, sell = 16 },
			{ itemName = "chain helmet", clientId = 3352, sell = 17 },
			{ itemName = "bone sword", clientId = 3338, sell = 20 },
			{ itemName = "studded helmet", clientId = 3376, sell = 20 },
			{ itemName = "legion helmet", clientId = 3374, sell = 22 },
			{ itemName = "brass shield", clientId = 3411, sell = 25 },
			{ itemName = "chain legs", clientId = 3558, sell = 25 },
			{ itemName = "hatchet", clientId = 3276, sell = 25 },
			{ itemName = "studded armor", clientId = 3378, sell = 25 },
			{ itemName = "sword", clientId = 3264, sell = 25 },
			{ itemName = "brass helmet", clientId = 3354, sell = 30 },
			{ itemName = "mace", clientId = 3286, sell = 30 },
			{ itemName = "katana", clientId = 3300, sell = 35 },
			{ itemName = "swampling club", clientId = 17824, sell = 40 },
			{ itemName = "plate shield", clientId = 3410, sell = 45 },
			{ itemName = "brass legs", clientId = 3372, sell = 49 },
			{ itemName = "copper shield", clientId = 3430, sell = 50 },
			{ itemName = "crowbar", clientId = 3304, sell = 50 },
			{ itemName = "longsword", clientId = 3285, sell = 51 },
			{ itemName = "viking helmet", clientId = 3367, sell = 66 },
			{ itemName = "chain armor", clientId = 3358, sell = 70 },
			{ itemName = "scale armor", clientId = 3377, sell = 75 },
			{ itemName = "battle axe", clientId = 3266, sell = 80 },
			{ itemName = "steel shield", clientId = 3409, sell = 80 },
			{ itemName = "viking shield", clientId = 3431, sell = 85 },
			{ itemName = "battle shield", clientId = 3413, sell = 95 },
			{ itemName = "dwarven shield", clientId = 3425, sell = 100 },
			{ itemName = "morning star", clientId = 3282, sell = 100 },
			{ itemName = "plate legs", clientId = 3557, sell = 115 },
			{ itemName = "carlin sword", clientId = 3283, sell = 118 },
			{ itemName = "battle hammer", clientId = 3305, sell = 120 },
			{ itemName = "brass armor", clientId = 3359, sell = 150 },
			{ itemName = "iron helmet", clientId = 3353, sell = 150 },
			{ itemName = "spike sword", clientId = 3271, sell = 240 },
			{ itemName = "red lantern", clientId = 10289, sell = 250 },
			{ itemName = "double axe", clientId = 3275, sell = 260 },
			{ itemName = "steel helmet", clientId = 3351, sell = 293 },
			{ itemName = "orcish axe", clientId = 3316, sell = 350 },
			{ itemName = "halberd", clientId = 3269, sell = 400 },
			{ itemName = "plate armor", clientId = 3357, sell = 400 },
			{ itemName = "two handed sword", clientId = 3265, sell = 450 },
			{ itemName = "fire sword", clientId = 3280, sell = 1000 },
			{ itemName = "broken halberd", clientId = 10418, sell = 100 },
			{ itemName = "spiked iron ball", clientId = 10408, sell = 100 },
			{ itemName = "Broken Slicer", clientId = 11661, sell = 120 },
			{ itemName = "high guard's shoulderplates", clientId = 10416, sell = 130 },
			{ itemName = "zaogun's shoulderplates", clientId = 10414, sell = 150 },
			{ itemName = "warmaster's wristguards", clientId = 10405, sell = 200 },
			{ itemName = "cursed shoulder spikes", clientId = 10410, sell = 320 },
			{ itemName = "draken wristbands", clientId = 11659, sell = 430 },
			{ itemName = "twin hooks", clientId = 10392, sell = 500 },
			{ itemName = "zaoan halberd", clientId = 10406, sell = 500 },
			{ itemName = "wailing widow's necklace", clientId = 10412, sell = 3000 },
			{ itemName = "zaoan shoes", clientId = 10386, sell = 5000 },
			{ itemName = "drachaku", clientId = 10391, sell = 10000 },
			{ itemName = "drakinata", clientId = 10388, sell = 10000 },
			{ itemName = "zaoan armor", clientId = 10384, sell = 14000 },
			{ itemName = "zaoan legs", clientId = 10387, sell = 14000 },
			{ itemName = "sai", clientId = 10389, sell = 16500 },
			{ itemName = "twiceslicer", clientId = 11657, sell = 28000 },
			{ itemName = "zaoan sword", clientId = 10390, sell = 30000 },
			{ itemName = "guardian boots", clientId = 10323, sell = 35000 },
			{ itemName = "draken boots", clientId = 4033, sell = 40000 },
			{ itemName = "zaoan helmet", clientId = 10385, sell = 45000 },
			{ itemName = "Elite Draken Mail", clientId = 11651, sell = 50000 },

			-- hanna
			{ itemName = "amber", clientId = 32626, sell = 20000 },
			{ itemName = "amber with a bug", clientId = 32624, sell = 41000 },
			{ itemName = "amber with a dragonfly", clientId = 32625, sell = 56000 },
			{ itemName = "ancient coin", clientId = 24390, sell = 350 },
			{ itemName = "bar of gold", clientId = 14112, sell = 10000 },
			{ itemName = "black pearl", clientId = 3027, sell = 280 },
			{ itemName = "soul orb", clientId = 5944, sell = 25 },
			{ itemName = "blue crystal shard", clientId = 16119, sell = 1500 },
			{ itemName = "blue crystal splinter", clientId = 16124, sell = 400 },
			{ itemName = "brown crystal splinter", clientId = 16123, sell = 400 },
			{ itemName = "coral brooch", clientId = 24391, sell = 750 },
			{ itemName = "crunor idol", clientId = 30055, sell = 30000 },
			{ itemName = "cyan crystal fragment", clientId = 16125, sell = 800 },
			{ itemName = "diamond", clientId = 32770, sell = 15000 },
			{ itemName = "dragon figurine", clientId = 30053, sell = 45000 },
			{ itemName = "eldritch crystal", clientId = 36835, sell = 48000 },
			{ itemName = "fiery tear", clientId = 39040, sell = 1070000 },
			{ itemName = "gemmed figurine", clientId = 24392, sell = 3500 },
			{ itemName = "giant amethyst", clientId = 32622, sell = 60000 },
			{ itemName = "giant emerald", clientId = 30060, sell = 90000 },
			{ itemName = "giant ruby", clientId = 30059, sell = 70000 },
			{ itemName = "giant sapphire", clientId = 30061, sell = 50000 },
			{ itemName = "giant shimmering pearl", clientId = 281, sell = 3000 }, -- green
			{ itemName = "giant shimmering pearl", clientId = 282, sell = 3000 }, -- brown
			{ itemName = "giant topaz", clientId = 32623, sell = 80000 },
			{ itemName = "gold ingot", clientId = 9058, sell = 5000 },
			{ itemName = "gold nugget", clientId = 3040, sell = 850 },
			{ itemName = "golden figurine", clientId = 5799, sell = 3000 },
			{ itemName = "green crystal fragment", clientId = 16127, sell = 800 },
			{ itemName = "green crystal shard", clientId = 16121, sell = 1500 },
			{ itemName = "green crystal splinter", clientId = 16122, sell = 400 },
			{ itemName = "hexagonal ruby", clientId = 30180, sell = 30000 },
			{ itemName = "lion figurine", clientId = 33781, sell = 10000 },
			{ itemName = "moonstone", clientId = 32771, sell = 13000 },
			{ itemName = "onyx chip", clientId = 22193, sell = 400 },
			{ itemName = "opal", clientId = 22194, sell = 500 },
			{ itemName = "ornate locket", clientId = 30056, sell = 18000 },
			{ itemName = "prismatic quartz", clientId = 24962, sell = 450 },
			{ itemName = "rainbow querz", clientId = 25737, sell = 500 },
			{ itemName = "red crystal fragment", clientId = 16126, sell = 800 },
			{ itemName = "royal almandine", clientId = 39038, sell = 460000 },
			{ itemName = "shimmering beetles", clientId = 25693, sell = 150 },
			{ itemName = "skull coin", clientId = 32583, sell = 12000 },
			{ itemName = "small amethyst", clientId = 3033, sell = 200 },
			{ itemName = "small diamond", clientId = 3028, sell = 300 },
			{ itemName = "small emerald", clientId = 3032, sell = 250 },
			{ itemName = "small enchanted amethyst", clientId = 678, sell = 200 },
			{ itemName = "small enchanted emerald", clientId = 677, sell = 250 },
			{ itemName = "small enchanted ruby", clientId = 676, sell = 250 },
			{ itemName = "small enchanted sapphire", clientId = 675, sell = 250 },
			{ itemName = "small ruby", clientId = 3030, sell = 250 },
			{ itemName = "small sapphire", clientId = 3029, sell = 250 },
			{ itemName = "small topaz", clientId = 9057, sell = 200 },
			{ itemName = "tiger eye", clientId = 24961, sell = 350 },
			{ itemName = "unicorn figurine", clientId = 30054, sell = 50000 },
			{ itemName = "violet crystal shard", clientId = 16120, sell = 1500 },
			{ itemName = "watermelon tourmaline", clientId = 33780, sell = 230000 },
			{ itemName = "watermelon touraline slice", clientId = 33779, sell = 30000 },
			{ itemName = "white silk flower", clientId = 34008, sell = 9000 },
			{ itemName = "wedding ring", clientId = 3004, sell = 100 },
			{ itemName = "white pearl", clientId = 3026, sell = 160 },
			{ itemName = "orichalcum pearl", clientId = 3026, sell = 80 },

			-- lailene
			{ itemName = "batwing hat", clientId = 9103, sell = 8000 },
			{ itemName = "ethno coat", clientId = 8064, sell = 200 },
			{ itemName = "focus cape", clientId = 8043, sell = 6000 },
			{ itemName = "jade hat", clientId = 10451, sell = 9000 },
			{ itemName = "spellweavers rob", clientId = 10438, sell = 12000 },
			{ itemName = "spirit cloak", clientId = 8042, sell = 350 },
			{ itemName = "zaoan robe", clientId = 10439, sell = 12000 },

			-- alexander
			{ itemName = "spellbook of enlightenment", clientId = 8072, sell = 4000 },
			{ itemName = "spellbook of lost souls", clientId = 8075, sell = 19000 },
			{ itemName = "spellbook of mind control", clientId = 8074, sell = 13000 },
			{ itemName = "spellbook of warding", clientId = 8073, sell = 8000 },

			-- rashid
			{ itemName = "abyss hammer", clientId = 7414, sell = 20000 },
			{ itemName = "albino plate", clientId = 19358, sell = 1500 },
			{ itemName = "amber staff", clientId = 7426, sell = 8000 },
			{ itemName = "ancient amulet", clientId = 3025, sell = 200 },
			{ itemName = "assassin dagger", clientId = 7404, sell = 20000 },
			{ itemName = "bandana", clientId = 5917, sell = 150 },
			{ itemName = "beastslayer axe", clientId = 3344, sell = 1500 },
			{ itemName = "beetle necklace", clientId = 10457, sell = 1500 },
			{ itemName = "berserker", clientId = 7403, sell = 40000 },
			{ itemName = "blacksteel sword", clientId = 7406, sell = 6000 },
			{ itemName = "blessed sceptre", clientId = 7429, sell = 40000 },
			{ itemName = "bone shield", clientId = 3441, sell = 80 },
			{ itemName = "bonelord helmet", clientId = 3408, sell = 7500 },
			{ itemName = "brutetamer's staff", clientId = 7379, sell = 1500 },
			{ itemName = "buckle", clientId = 17829, sell = 7000 },
			{ itemName = "castle shield", clientId = 3435, sell = 5000 },
			{ itemName = "chain bolter", clientId = 8022, sell = 40000 },
			{ itemName = "chaos mace", clientId = 7427, sell = 9000 },
			{ itemName = "cobra crown", clientId = 11674, sell = 50000 },
			{ itemName = "coconut shoes", clientId = 9017, sell = 500 },
			{ itemName = "composite hornbow", clientId = 8027, sell = 25000 },
			{ itemName = "cranial basher", clientId = 7415, sell = 30000 },
			{ itemName = "crocodile boots", clientId = 3556, sell = 1000 },
			{ itemName = "crystal crossbow", clientId = 16163, sell = 35000 },
			{ itemName = "crystal mace", clientId = 3333, sell = 12000 },
			{ itemName = "crystal necklace", clientId = 3008, sell = 400 },
			{ itemName = "crystal ring", clientId = 3007, sell = 250 },
			{ itemName = "crystal sword", clientId = 7449, sell = 600 },
			{ itemName = "crystalline armor", clientId = 8050, sell = 16000 },
			{ itemName = "daramian mace", clientId = 3327, sell = 110 },
			{ itemName = "daramian waraxe", clientId = 3328, sell = 1000 },
			{ itemName = "dark shield", clientId = 3421, sell = 400 },
			{ itemName = "death ring", clientId = 6299, sell = 1000 },
			{ itemName = "demon shield", clientId = 3420, sell = 30000 },
			{ itemName = "demonbone amulet", clientId = 3019, sell = 32000 },
			{ itemName = "demonrage sword", clientId = 7382, sell = 36000 },
			{ itemName = "devil helmet", clientId = 3356, sell = 1000 },
			{ itemName = "diamond sceptre", clientId = 7387, sell = 3000 },
			{ itemName = "divine plate", clientId = 8057, sell = 55000 },
			{ itemName = "djinn blade", clientId = 3339, sell = 15000 },
			{ itemName = "doll", clientId = 2991, sell = 200 },
			{ itemName = "dragon scale mail", clientId = 3386, sell = 40000 },
			{ itemName = "dragon slayer", clientId = 7402, sell = 15000 },
			{ itemName = "dragonbone staff", clientId = 7430, sell = 3000 },
			{ itemName = "dwarven armor", clientId = 3397, sell = 30000 },
			{ itemName = "elvish bow", clientId = 7438, sell = 2000 },
			{ itemName = "emerald bangle", clientId = 3010, sell = 800 },
			{ itemName = "epee", clientId = 3326, sell = 8000 },
			{ itemName = "flower dress", clientId = 9015, sell = 1000 },
			{ itemName = "flower wreath", clientId = 9013, sell = 500 },
			{ itemName = "fur boots", clientId = 7457, sell = 2000 },
			{ itemName = "furry club", clientId = 7432, sell = 1000 },
			{ itemName = "glacier amulet", clientId = 815, sell = 1500 },
			{ itemName = "glacier kilt", clientId = 823, sell = 11000 },
			{ itemName = "glacier mask", clientId = 829, sell = 2500 },
			{ itemName = "glacier robe", clientId = 824, sell = 11000 },
			{ itemName = "glacier shoes", clientId = 819, sell = 2500 },
			{ itemName = "gold ring", clientId = 3063, sell = 8000 },
			{ itemName = "golden armor", clientId = 3360, sell = 20000 },
			{ itemName = "golden legs", clientId = 3364, sell = 30000 },
			{ itemName = "goo shell", clientId = 19372, sell = 4000 },
			{ itemName = "griffin shield", clientId = 3433, sell = 3000 },
			{ itemName = "guardian halberd", clientId = 3315, sell = 11000 },
			{ itemName = "hammer of wrath", clientId = 3332, sell = 30000 },
			{ itemName = "headchopper", clientId = 7380, sell = 6000 },
			{ itemName = "heavy mace", clientId = 3340, sell = 50000 },
			{ itemName = "heavy machete", clientId = 3330, sell = 90 },
			{ itemName = "heavy trident", clientId = 12683, sell = 2000 },
			{ itemName = "helmet of the lost", clientId = 17852, sell = 2000 },
			{ itemName = "heroic axe", clientId = 7389, sell = 30000 },
			{ itemName = "hibiscus dress", clientId = 8045, sell = 3000 },
			{ itemName = "hieroglyph banner", clientId = 12482, sell = 500 },
			{ itemName = "horn", clientId = 19359, sell = 300 },
			{ itemName = "jade hammer", clientId = 7422, sell = 25000 },
			{ itemName = "krimhorn helmet", clientId = 7461, sell = 200 },
			{ itemName = "lavos armor", clientId = 8049, sell = 16000 },
			{ itemName = "leaf legs", clientId = 9014, sell = 500 },
			{ itemName = "leopard armor", clientId = 3404, sell = 1000 },
			{ itemName = "leviathan's amulet", clientId = 9303, sell = 3000 },
			{ itemName = "light shovel", clientId = 5710, sell = 300 },
			{ itemName = "lightning boots", clientId = 820, sell = 2500 },
			{ itemName = "lightning headband", clientId = 828, sell = 2500 },
			{ itemName = "lightning legs", clientId = 822, sell = 11000 },
			{ itemName = "lightning pendant", clientId = 816, sell = 1500 },
			{ itemName = "lightning robe", clientId = 825, sell = 11000 },
			{ itemName = "lunar staff", clientId = 7424, sell = 5000 },
			{ itemName = "magic plate armor", clientId = 3366, sell = 90000 },
			{ itemName = "magma amulet", clientId = 817, sell = 1500 },
			{ itemName = "magma boots", clientId = 818, sell = 2500 },
			{ itemName = "magma coat", clientId = 826, sell = 11000 },
			{ itemName = "magma legs", clientId = 821, sell = 11000 },
			{ itemName = "magma monocle", clientId = 827, sell = 2500 },
			{ itemName = "mammoth fur cape", clientId = 7463, sell = 6000 },
			{ itemName = "mammoth fur shorts", clientId = 7464, sell = 850 },
			{ itemName = "mammoth whopper", clientId = 7381, sell = 300 },
			{ itemName = "mastermind shield", clientId = 3414, sell = 50000 },
			{ itemName = "medusa shield", clientId = 3436, sell = 9000 },
			{ itemName = "mercenary sword", clientId = 7386, sell = 12000 },
			{ itemName = "model ship", clientId = 2994, sell = 1000 },
			{ itemName = "mycological bow", clientId = 16164, sell = 35000 },
			{ itemName = "mystic blade", clientId = 7384, sell = 30000 },
			{ itemName = "naginata", clientId = 3314, sell = 2000 },
			{ itemName = "nightmare blade", clientId = 7418, sell = 35000 },
			{ itemName = "noble axe", clientId = 7456, sell = 10000 },
			{ itemName = "norse shield", clientId = 7460, sell = 1500 },
			{ itemName = "onyx pendant", clientId = 22195, sell = 3500 },
			{ itemName = "orcish maul", clientId = 7392, sell = 6000 },
			{ itemName = "oriental shoes", clientId = 21981, sell = 15000 },
			{ itemName = "pair of iron fists", clientId = 17828, sell = 4000 },
			{ itemName = "paladin armor", clientId = 8063, sell = 15000 },
			{ itemName = "patched boots", clientId = 3550, sell = 2000 },
			{ itemName = "pharaoh banner", clientId = 12483, sell = 1000 },
			{ itemName = "pharaoh sword", clientId = 3334, sell = 23000 },
			{ itemName = "pirate boots", clientId = 5461, sell = 3000 },
			{ itemName = "pirate hat", clientId = 6096, sell = 1000 },
			{ itemName = "pirate knee breeches", clientId = 5918, sell = 200 },
			{ itemName = "pirate shirt", clientId = 6095, sell = 500 },
			{ itemName = "pirate voodoo doll", clientId = 5810, sell = 500 },
			{ itemName = "platinum amulet", clientId = 3055, sell = 2500 },
			{ itemName = "ragnir helmet", clientId = 7462, sell = 400 },
			{ itemName = "relic sword", clientId = 7383, sell = 25000 },
			{ itemName = "rift bow", clientId = 22866, sell = 45000 },
			{ itemName = "rift crossbow", clientId = 22867, sell = 45000 },
			{ itemName = "rift lance", clientId = 22727, sell = 30000 },
			{ itemName = "rift shield", clientId = 22726, sell = 50000 },
			{ itemName = "ring of the sky", clientId = 3006, sell = 30000 },
			{ itemName = "royal axe", clientId = 7434, sell = 40000 },
			{ itemName = "ruby necklace", clientId = 3016, sell = 2000 },
			{ itemName = "ruthless axe", clientId = 6553, sell = 45000 },
			{ itemName = "sacred tree amulet", clientId = 9302, sell = 3000 },
			{ itemName = "sapphire hammer", clientId = 7437, sell = 7000 },
			{ itemName = "scarab amulet", clientId = 3018, sell = 200 },
			{ itemName = "scarab shield", clientId = 3440, sell = 2000 },
			{ itemName = "shockwave amulet", clientId = 9304, sell = 3000 },
			{ itemName = "silver brooch", clientId = 3017, sell = 150 },
			{ itemName = "silver dagger", clientId = 3290, sell = 500 },
			{ itemName = "skull helmet", clientId = 5741, sell = 40000 },
			{ itemName = "skullcracker armor", clientId = 8061, sell = 18000 },
			{ itemName = "spiked squelcher", clientId = 7452, sell = 5000 },
			{ itemName = "steel boots", clientId = 3554, sell = 30000 },
			{ itemName = "swamplair armor", clientId = 8052, sell = 16000 },
			{ itemName = "taurus mace", clientId = 7425, sell = 500 },
			{ itemName = "tempest shield", clientId = 3442, sell = 35000 },
			{ itemName = "terra amulet", clientId = 814, sell = 1500 },
			{ itemName = "terra boots", clientId = 813, sell = 2500 },
			{ itemName = "terra hood", clientId = 830, sell = 2500 },
			{ itemName = "terra legs", clientId = 812, sell = 11000 },
			{ itemName = "terra mantle", clientId = 811, sell = 11000 },
			{ itemName = "the justice seeker", clientId = 7390, sell = 40000 },
			{ itemName = "tortoise shield", clientId = 6131, sell = 150 },
			{ itemName = "vile axe", clientId = 7388, sell = 30000 },
			{ itemName = "voodoo doll", clientId = 3002, sell = 400 },
			{ itemName = "war axe", clientId = 3342, sell = 12000 },
			{ itemName = "war horn", clientId = 2958, sell = 8000 },
			{ itemName = "witch hat", clientId = 9653, sell = 5000 },
			{ itemName = "wyvern fang", clientId = 7408, sell = 1500 },

			-- rock in a hard place
			{ itemName = "axe", clientId = 3274, sell = 7 },
			{ itemName = "battle axe", clientId = 3266, sell = 80 },
			{ itemName = "battle hammer", clientId = 3305, sell = 120 },
			{ itemName = "battle shield", clientId = 3413, sell = 95 },
			{ itemName = "bone club", clientId = 3337, sell = 5 },
			{ itemName = "bone sword", clientId = 3338, sell = 20 },
			{ itemName = "bow", clientId = 3350, sell = 100 },
			{ itemName = "brass armor", clientId = 3359, sell = 150 },
			{ itemName = "brass helmet", clientId = 3354, sell = 30 },
			{ itemName = "brass legs", clientId = 3372, sell = 49 },
			{ itemName = "brass shield", clientId = 3411, sell = 25 },
			{ itemName = "calopteryx cape", clientId = 14086, sell = 15000 },
			{ itemName = "carapace shield", clientId = 14088, sell = 32000 },
			{ itemName = "carlin sword", clientId = 3283, sell = 118 },
			{ itemName = "chain armor", clientId = 3358, sell = 70 },
			{ itemName = "chain helmet", clientId = 3352, sell = 17 },
			{ itemName = "chain legs", clientId = 3558, sell = 25 },
			{ itemName = "closed trap", clientId = 3481, sell = 75 },
			{ itemName = "club", clientId = 3270, sell = 1 },
			{ itemName = "coat", clientId = 3562, sell = 1 },
			{ itemName = "compound eye", clientId = 14083, sell = 150 },
			{ itemName = "copper shield", clientId = 3430, sell = 50 },
			{ itemName = "crawler head plating", clientId = 14079, sell = 210 },
			{ itemName = "crossbow", clientId = 3349, sell = 120 },
			{ itemName = "crowbar", clientId = 3304, sell = 50 },
			{ itemName = "dagger", clientId = 3267, sell = 2 },
			{ itemName = "deepling axe", clientId = 13991, sell = 40000 },
			{ itemName = "deepling breaktime snack", clientId = 14011, sell = 90 },
			{ itemName = "deepling claw", clientId = 14044, sell = 430 },
			{ itemName = "deepling guard belt buckle", clientId = 14010, sell = 230 },
			{ itemName = "deepling ridge", clientId = 14041, sell = 360 },
			{ itemName = "deepling scales", clientId = 14017, sell = 80 },
			{ itemName = "deepling squelcher", clientId = 14250, sell = 7000 },
			{ itemName = "deepling staff", clientId = 13987, sell = 4000 },
			{ itemName = "deepling warts", clientId = 14012, sell = 180 },
			{ itemName = "deeptags", clientId = 14013, sell = 290 },
			{ itemName = "depth calcei", clientId = 13997, sell = 25000 },
			{ itemName = "depth galea", clientId = 13995, sell = 35000 },
			{ itemName = "depth lorica", clientId = 13994, sell = 30000 },
			{ itemName = "depth ocrea", clientId = 13996, sell = 16000 },
			{ itemName = "depth scutum", clientId = 13998, sell = 36000 },
			{ itemName = "double axe", clientId = 3275, sell = 260 },
			{ itemName = "doublet", clientId = 3379, sell = 3 },
			{ itemName = "dung ball", clientId = 14225, sell = 130 },
			{ itemName = "dwarven shield", clientId = 3425, sell = 100 },
			{ itemName = "empty potion flask", clientId = 283, sell = 5 },
			{ itemName = "empty potion flask", clientId = 284, sell = 5 },
			{ itemName = "empty potion flask", clientId = 285, sell = 5 },
			{ itemName = "eye of a deepling", clientId = 12730, sell = 150 },
			{ itemName = "fire sword", clientId = 3280, sell = 1000 },
			{ itemName = "fishing rod", clientId = 3483, sell = 40 },
			{ itemName = "grasshopper legs", clientId = 14087, sell = 15000 },
			{ itemName = "guardian axe", clientId = 14043, sell = 9000 },
			{ itemName = "halberd", clientId = 3269, sell = 400 },
			{ itemName = "hand axe", clientId = 3268, sell = 4 },
			{ itemName = "hatchet", clientId = 3276, sell = 25 },
			{ itemName = "hive bow", clientId = 14246, sell = 28000 },
			{ itemName = "hive scythe", clientId = 14089, sell = 17000 },
			{ itemName = "iron helmet", clientId = 3353, sell = 150 },
			{ itemName = "jacket", clientId = 3561, sell = 1 },
			{ itemName = "katana", clientId = 3300, sell = 35 },
			{ itemName = "key to the drowned library", clientId = 14009, sell = 330 },
			{ itemName = "kollos shell", clientId = 14077, sell = 420 },
			{ itemName = "leather armor", clientId = 3361, sell = 12 },
			{ itemName = "leather boots", clientId = 3552, sell = 2 },
			{ itemName = "leather helmet", clientId = 3355, sell = 4 },
			{ itemName = "leather legs", clientId = 3559, sell = 9 },
			{ itemName = "legion helmet", clientId = 3374, sell = 22 },
			{ itemName = "longsword", clientId = 3285, sell = 51 },
			{ itemName = "mace", clientId = 3286, sell = 30 },
			{ itemName = "machete", clientId = 3308, sell = 6 },
			{ itemName = "morning star", clientId = 3282, sell = 100 },
			{ itemName = "necklace of the deep", clientId = 13990, sell = 3000 },
			{ itemName = "orcish axe", clientId = 3316, sell = 350 },
			{ itemName = "ornate chestplate", clientId = 13993, sell = 60000 },
			{ itemName = "ornate crossbow", clientId = 14247, sell = 12000 },
			{ itemName = "ornate legs", clientId = 13999, sell = 40000 },
			{ itemName = "ornate mace", clientId = 14001, sell = 42000 },
			{ itemName = "ornate shield", clientId = 14000, sell = 42000 },
			{ itemName = "pick", clientId = 3456, sell = 15 },
			{ itemName = "plate armor", clientId = 3357, sell = 400 },
			{ itemName = "plate legs", clientId = 3557, sell = 115 },
			{ itemName = "plate shield", clientId = 3410, sell = 45 },
			{ itemName = "rapier", clientId = 3272, sell = 5 },
			{ itemName = "rope", clientId = 3003, sell = 15 },
			{ itemName = "sabre", clientId = 3273, sell = 12 },
			{ itemName = "scale armor", clientId = 3377, sell = 75 },
			{ itemName = "scythe", clientId = 3453, sell = 10 },
			{ itemName = "short sword", clientId = 3294, sell = 10 },
			{ itemName = "shovel", clientId = 3457, sell = 8 },
			{ itemName = "sickle", clientId = 3293, sell = 3 },
			{ itemName = "small axe", clientId = 3462, sell = 5 },
			{ itemName = "soldier helmet", clientId = 3375, sell = 16 },
			{ itemName = "spear", clientId = 3277, sell = 3 },
			{ itemName = "spellsinger's seal", clientId = 14008, sell = 280 },
			{ itemName = "spidris mandible", clientId = 14082, sell = 450 },
			{ itemName = "spike sword", clientId = 3271, sell = 240 },
			{ itemName = "spitter nose", clientId = 14078, sell = 340 },
			{ itemName = "steel helmet", clientId = 3351, sell = 293 },
			{ itemName = "steel shield", clientId = 3409, sell = 80 },
			{ itemName = "studded armor", clientId = 3378, sell = 25 },
			{ itemName = "studded club", clientId = 3336, sell = 10 },
			{ itemName = "studded helmet", clientId = 3376, sell = 20 },
			{ itemName = "studded legs", clientId = 3362, sell = 15 },
			{ itemName = "studded shield", clientId = 3426, sell = 16 },
			{ itemName = "swampling club", clientId = 17824, sell = 40 },
			{ itemName = "swarmer antenna", clientId = 14076, sell = 130 },
			{ itemName = "sword", clientId = 3264, sell = 25 },
			{ itemName = "throwing knife", clientId = 3298, sell = 2 },
			{ itemName = "two handed sword", clientId = 3265, sell = 450 },
			{ itemName = "vial", clientId = 2874, sell = 5 },
			{ itemName = "viking helmet", clientId = 3367, sell = 66 },
			{ itemName = "viking shield", clientId = 3431, sell = 85 },
			{ itemName = "war hammer", clientId = 3279, sell = 470 },
			{ itemName = "warrior's axe", clientId = 14040, sell = 11000 },
			{ itemName = "warrior's shield", clientId = 14042, sell = 9000 },
			{ itemName = "waspoid claw", clientId = 14080, sell = 320 },
			{ itemName = "waspoid wing", clientId = 14081, sell = 190 },
			{ itemName = "watch", clientId = 2906, sell = 6 },
			{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
			{ itemName = "wooden shield", clientId = 3412, sell = 5 },

			-- tamoril
			{ itemName = "blue gem", clientId = 3041, sell = 5000 },
			{ itemName = "golden mug", clientId = 2903, sell = 250 },
			{ itemName = "green gem", clientId = 3038, sell = 5000 },
			{ itemName = "red gem", clientId = 3039, sell = 1000 },
			{ itemName = "violet gem", clientId = 3036, sell = 10000 },
			{ itemName = "white gem", clientId = 32769, sell = 12000 },
			{ itemName = "yellow gem", clientId = 3037, sell = 1000 },

			-- telas
			{ itemName = "ancient stone", clientId = 9632, sell = 200 },
			{ itemName = "battle stone", clientId = 11447, sell = 290 },
			{ itemName = "broken gladiator shield", clientId = 9656, sell = 190 },
			{ itemName = "coal", clientId = 12600, sell = 20 },
			{ itemName = "crystal of balance", clientId = 9028, sell = 1000 },
			{ itemName = "crystal of focus", clientId = 9027, sell = 2000 },
			{ itemName = "crystal of power", clientId = 9067, sell = 3000 },
			{ itemName = "crystal pedestal", clientId = 9063, sell = 500 },
			{ itemName = "crystalline spikes", clientId = 16138, sell = 440 },
			{ itemName = "flintstone", clientId = 12806, sell = 800 },
			{ itemName = "gear crystal", clientId = 9655, sell = 200 },
			{ itemName = "gear wheel", clientId = 8775, sell = 500 },
			{ itemName = "huge chunk of crude iron", clientId = 5892, sell = 15000 },
			{ itemName = "magma clump", clientId = 16130, sell = 570 },
			{ itemName = "metal spike", clientId = 10298, sell = 320 },
			{ itemName = "piece of draconian steel", clientId = 5889, sell = 3000 },
			{ itemName = "piece of hell steel", clientId = 5888, sell = 500 },
			{ itemName = "piece of hellfire armor", clientId = 9664, sell = 550 },
			{ itemName = "piece of royal steel", clientId = 5887, sell = 10000 },
			{ itemName = "pulverized ore", clientId = 16133, sell = 400 },
			{ itemName = "shiny stone", clientId = 10310, sell = 500 },
			{ itemName = "stone nose", clientId = 16137, sell = 590 },
			{ itemName = "sulphurous stone", clientId = 10315, sell = 100 },
			{ itemName = "vein of ore", clientId = 16135, sell = 330 },
			{ itemName = "war crystal", clientId = 9654, sell = 460 },

			-- fadil
			{ itemName = "ring of blue plasma", clientId = 23529, sell = 8000 },
			{ itemName = "ring of green plasma", clientId = 23531, sell = 8000 },
			{ itemName = "ring of red plasma", clientId = 23533, sell = 8000 },
			{ itemName = "collar of blue plasma", clientId = 23542, sell = 6000 },
			{ itemName = "collar of green plasma", clientId = 23543, sell = 6000 },
			{ itemName = "collar of red plasma", clientId = 23544, sell = 6000 },

			-- yasir
			{ itemName = "golden sun token", clientId = 43734, sell = 11000 },
			{ itemName = "abomination's tail", clientId = 36791, sell = 700000 },
			{ itemName = "abomination's tongue", clientId = 36793, sell = 900000 },
			{ itemName = "abomination's eye", clientId = 36792, sell = 650000 },
			{ itemName = "afflicted strider head", clientId = 36789, sell = 900 },
			{ itemName = "afflicted strider worms", clientId = 36790, sell = 500 },
			{ itemName = "acorn", clientId = 10296, sell = 10 },
			{ itemName = "alptramun's toothbrush", clientId = 29943, sell = 270000 },
			{ itemName = "ancient belt buckle", clientId = 24384, sell = 260 },
			{ itemName = "ancient liche bone", clientId = 31588, sell = 28000 },
			{ itemName = "angel figurine", clientId = 32589, sell = 36000 },
			{ itemName = "antlers", clientId = 10297, sell = 50 },
			{ itemName = "ape fur", clientId = 5883, sell = 120 },
			{ itemName = "apron", clientId = 33933, sell = 1300 },
			{ itemName = "badger fur", clientId = 903, sell = 15 },
			{ itemName = "bamboo stick", clientId = 11445, sell = 30 },
			{ itemName = "banana sash", clientId = 11511, sell = 55 },
			{ itemName = "basalt fetish", clientId = 17856, sell = 210 },
			{ itemName = "basalt figurine", clientId = 17857, sell = 160 },
			{ itemName = "basalt core", clientId = 43859, sell = 5800 },
			{ itemName = "basalt crumbs", clientId = 43858, sell = 3000 },
			{ itemName = "bat decoration", clientId = 6491, sell = 2000 },
			{ itemName = "bat wing", clientId = 5894, sell = 50 },
			{ itemName = "bashmu fang", clientId = 36820, sell = 600 },
			{ itemName = "bashmu feather", clientId = 36823, sell = 350 },
			{ itemName = "bashmu tongue", clientId = 36821, sell = 400 },
			{ itemName = "bear paw", clientId = 5896, sell = 100 },
			{ itemName = "beast's nightmare-cushion", clientId = 29946, sell = 630000 },
			{ itemName = "bed of nails", clientId = 25743, sell = 500 },
			{ itemName = "beer tap", clientId = 32114, sell = 50 },
			{ itemName = "beetle carapace", clientId = 24381, sell = 200 },
			{ itemName = "behemoth claw", clientId = 5930, sell = 2000 },
			{ itemName = "black hood", clientId = 9645, sell = 190 },
			{ itemName = "black wool", clientId = 11448, sell = 300 },
			{ itemName = "blazing bone", clientId = 16131, sell = 610 },
			{ itemName = "blemished spawn abdomen", clientId = 36779, sell = 550 },
			{ itemName = "blemished spawn head", clientId = 36778, sell = 800 },
			{ itemName = "blemished spawn tail", clientId = 36780, sell = 1000 },
			{ itemName = "bloated maggot", clientId = 43856, sell = 5200 },
			{ itemName = "blood preservation", clientId = 11449, sell = 320 },
			{ itemName = "blood tincture in a vial", clientId = 18928, sell = 360 },
			{ itemName = "blooded worm", clientId = 43857, sell = 4700 },
			{ itemName = "bloody dwarven beard", clientId = 17827, sell = 110 },
			{ itemName = "bloody pincers", clientId = 9633, sell = 100 },
			{ itemName = "bloody tears", clientId = 32594, sell = 70000 },
			{ itemName = "blue glass plate", clientId = 29345, sell = 60 },
			{ itemName = "blue goanna scale", clientId = 31559, sell = 230 },
			{ itemName = "blue piece of cloth", clientId = 5912, sell = 200 },
			{ itemName = "boggy dreads", clientId = 9667, sell = 200 },
			{ itemName = "bola", clientId = 17809, sell = 35 },
			{ itemName = "bone fetish", clientId = 17831, sell = 150 },
			{ itemName = "bone shoulderplate", clientId = 10404, sell = 150 },
			{ itemName = "bone toothpick", clientId = 24380, sell = 150 },
			{ itemName = "bonecarving knife", clientId = 17830, sell = 190 },
			{ itemName = "bonelord eye", clientId = 5898, sell = 80 },
			{ itemName = "bones of zorvorax", clientId = 24942, sell = 10000 },
			{ itemName = "bony tail", clientId = 10277, sell = 210 },
			{ itemName = "book of necromantic rituals", clientId = 10320, sell = 180 },
			{ itemName = "book of prayers", clientId = 9646, sell = 120 },
			{ itemName = "book page", clientId = 28569, sell = 640 },
			{ itemName = "bowl of terror sweat", clientId = 20204, sell = 500 },
			{ itemName = "brain head's giant neuron", clientId = 32578, sell = 100000 },
			{ itemName = "brain head's left hemisphere", clientId = 32579, sell = 90000 },
			{ itemName = "brain head's right hemisphere", clientId = 32580, sell = 50000 },
			{ itemName = "brainstealer's brain", clientId = 36795, sell = 300000 },
			{ itemName = "brainstealer's brainwave", clientId = 36796, sell = 440000 },
			{ itemName = "brainstealer's tissue", clientId = 36794, sell = 240000 },
			{ itemName = "bright bell", clientId = 30324, sell = 220 },
			{ itemName = "brimstone fangs", clientId = 11702, sell = 380 },
			{ itemName = "brimstone shell", clientId = 11703, sell = 210 },
			{ itemName = "broken bell", clientId = 30185, sell = 150 },
			{ itemName = "broken crossbow", clientId = 11451, sell = 30 },
			{ itemName = "broken draken mail", clientId = 11660, sell = 340 },
			{ itemName = "broken helmet", clientId = 11453, sell = 20 },
			{ itemName = "broken iks cuirass", clientId = 40533, sell = 640 },
			{ itemName = "broken iks faulds", clientId = 40531, sell = 530 },
			{ itemName = "broken iks headpiece", clientId = 40532, sell = 560 },
			{ itemName = "broken iks sandals", clientId = 40534, sell = 440 },
			{ itemName = "broken key ring", clientId = 11652, sell = 8000 },
			{ itemName = "broken longbow", clientId = 34161, sell = 130 },
			{ itemName = "broken macuahuitl", clientId = 40530, sell = 1000 },
			{ itemName = "broken ring of ending", clientId = 12737, sell = 4000 },
			{ itemName = "broken shamanic staff", clientId = 11452, sell = 35 },
			{ itemName = "broken throwing axe", clientId = 17851, sell = 230 },
			{ itemName = "broken visor", clientId = 20184, sell = 1900 },
			{ itemName = "brooch of embracement", clientId = 34023, sell = 14000 },
			{ itemName = "brown piece of cloth", clientId = 5913, sell = 100 },
			{ itemName = "bunch of troll hair", clientId = 9689, sell = 30 },
			{ itemName = "bundle of cursed straw", clientId = 9688, sell = 800 },
			{ itemName = "capricious heart", clientId = 34138, sell = 2100 },
			{ itemName = "capricious robe", clientId = 34145, sell = 1200 },
			{ itemName = "carniphila seeds", clientId = 10300, sell = 50 },
			{ itemName = "carnisylvan bark", clientId = 36806, sell = 230 },
			{ itemName = "carnisylvan finger", clientId = 36805, sell = 250 },
			{ itemName = "carnivostrich feather", clientId = 40586, sell = 630 },
			{ itemName = "carrion worm fang", clientId = 10275, sell = 35 },
			{ itemName = "cat's paw", clientId = 5479, sell = 2000 },
			{ itemName = "cave chimera head", clientId = 36787, sell = 1200 },
			{ itemName = "cave chimera leg", clientId = 36788, sell = 650 },
			{ itemName = "cave devourer eyes", clientId = 27599, sell = 550 },
			{ itemName = "cave devourer eyes", clientId = 27599, sell = 550 },
			{ itemName = "cave devourer legs", clientId = 27601, sell = 350 },
			{ itemName = "cave devourer maw", clientId = 27600, sell = 600 },
			{ itemName = "centipede leg", clientId = 10301, sell = 28 },

			--Chargoz igneous obsidian falta
			{ itemName = "chasm spawn abdomen", clientId = 27603, sell = 240 },
			{ itemName = "chasm spawn head", clientId = 27602, sell = 850 },
			{ itemName = "chasm spawn tail", clientId = 27604, sell = 120 },
			{ itemName = "cheese cutter", clientId = 17817, sell = 50 },
			{ itemName = "cheesy figurine", clientId = 17818, sell = 150 },
			{ itemName = "cheesy membership card", clientId = 35614, sell = 120000 },
			{ itemName = "chicken feather", clientId = 5890, sell = 30 },
			{ itemName = "chitinous mouth", clientId = 27626, sell = 10000 },
			{ itemName = "cliff strider claw", clientId = 16134, sell = 800 },
			{ itemName = "closed pocket sundial", clientId = 43888, sell = 5000 },
			{ itemName = "cobra crest", clientId = 31678, sell = 650 },
			{ itemName = "cobra tongue", clientId = 9634, sell = 15 },
			{ itemName = "colourful feather", clientId = 11514, sell = 110 },
			{ itemName = "colourful feathers", clientId = 25089, sell = 400 },
			{ itemName = "colourful snail shell", clientId = 25696, sell = 250 },
			{ itemName = "compass", clientId = 10302, sell = 45 },
			{ itemName = "compound eye", clientId = 14083, sell = 150 },
			{ itemName = "condensed energy", clientId = 23501, sell = 260 },
			{ itemName = "coral branch", clientId = 39406, sell = 360 },
			{ itemName = "corrupt naga scales", clientId = 39415, sell = 570 },
			{ itemName = "corrupted flag", clientId = 10409, sell = 700 },
			{ itemName = "countess sorrow's frozen tear", clientId = 6536, sell = 50000 },
			{ itemName = "cow bell", clientId = 32012, sell = 120 },
			{ itemName = "crab man claws", clientId = 40582, sell = 550 },
			{ itemName = "crab pincers", clientId = 10272, sell = 35 },
			{ itemName = "cracked alabaster vase", clientId = 24385, sell = 180 },
			{ itemName = "crawler head plating", clientId = 14079, sell = 210 },
			{ itemName = "crawler's essence", clientId = 33982, sell = 3700 },
			{ itemName = "crown", clientId = 33935, sell = 2700 },
			{ itemName = "cruelty's chest", clientId = 33923, sell = 720000 },
			{ itemName = "cruelty's claw", clientId = 33922, sell = 640000 },
			{ itemName = "cry-stal", clientId = 39394, sell = 3200 },
			{ itemName = "crystal bone", clientId = 23521, sell = 250 },
			{ itemName = "crystallized anger", clientId = 23507, sell = 400 },
			{ itemName = "cultish mask", clientId = 9638, sell = 280 },
			{ itemName = "cultish robe", clientId = 9639, sell = 150 },
			{ itemName = "cultish symbol", clientId = 11455, sell = 500 },
			{ itemName = "curl of hair", clientId = 36809, sell = 320000 },
			{ itemName = "curious matter", clientId = 23511, sell = 430 },
			{ itemName = "cursed bone", clientId = 32774, sell = 6000 },
			{ itemName = "cursed shoulder spikes", clientId = 10410, sell = 320 },
			{ itemName = "cyclops toe", clientId = 9657, sell = 55 },
			{ itemName = "damaged armor plates", clientId = 28822, sell = 280 },
			{ itemName = "damaged worm head", clientId = 27620, sell = 8000 },
			{ itemName = "damselfly eye", clientId = 17463, sell = 25 },
			{ itemName = "damselfly wing", clientId = 17458, sell = 20 },
			{ itemName = "dandelion seeds", clientId = 25695, sell = 200 },
			{ itemName = "dangerous proto matter", clientId = 23515, sell = 300 },
			{ itemName = "dark bell", clientId = 32596, sell = 310000 },
			{ itemName = "dark obsidian splinter", clientId = 43850, sell = 4400 },
			{ itemName = "dark rosary", clientId = 10303, sell = 48 },
			{ itemName = "darklight basalt chunk", clientId = 43852, sell = 3800 },

			-- darklight figurine falta
			{ itemName = "darklight core", clientId = 43853, sell = 4100 },
			{ itemName = "darklight matter", clientId = 43851, sell = 5500 },
			{ itemName = "decayed finger bone", clientId = 43846, sell = 5100 },
			{ itemName = "dead weight", clientId = 20202, sell = 450 },
			{ itemName = "deepling breaktime snack", clientId = 14011, sell = 90 },
			{ itemName = "deepling claw", clientId = 14044, sell = 430 },
			{ itemName = "deepling guard belt buckle", clientId = 14010, sell = 230 },
			{ itemName = "deepling ridge", clientId = 14041, sell = 360 },
			{ itemName = "deepling scales", clientId = 14017, sell = 80 },
			{ itemName = "deepling warts", clientId = 14012, sell = 180 },
			{ itemName = "deeptags", clientId = 14013, sell = 290 },
			{ itemName = "deepworm jaws", clientId = 27594, sell = 500 },
			{ itemName = "deepworm spike roots", clientId = 27593, sell = 650 },
			{ itemName = "deepworm spikes", clientId = 27592, sell = 800 },
			{ itemName = "demon dust", clientId = 5526, sell = 300 },
			{ itemName = "demon horn", clientId = 5954, sell = 1000 },
			{ itemName = "demonic finger", clientId = 12541, sell = 1000 },
			{ itemName = "demonic skeletal hand", clientId = 9647, sell = 80 },
			{ itemName = "demonic essence", clientId = 6499, sell = 1000 },
			{ itemName = "diabolic skull", clientId = 34025, sell = 19000 },
			{ itemName = "diremaw brainpan", clientId = 27597, sell = 350 },
			{ itemName = "diremaw legs", clientId = 27598, sell = 270 },
			{ itemName = "dirty turban", clientId = 11456, sell = 120 },
			{ itemName = "distorted heart", clientId = 34142, sell = 2100 },
			{ itemName = "distorted robe", clientId = 34149, sell = 1200 },
			{ itemName = "downy feather", clientId = 11684, sell = 20 },
			{ itemName = "dowser", clientId = 19110, sell = 35 },
			{ itemName = "dracola's eye", clientId = 6546, sell = 50000 },
			{ itemName = "dracoyle statue", clientId = 9034, sell = 5000 },
			{ itemName = "dragon blood", clientId = 24937, sell = 700 },
			{ itemName = "dragon claw", clientId = 5919, sell = 8000 },
			{ itemName = "dragon priest's wandtip", clientId = 10444, sell = 175 },
			{ itemName = "dragon tongue", clientId = 24938, sell = 550 },
			{ itemName = "dragon's tail", clientId = 11457, sell = 100 },
			{ itemName = "draken sulphur", clientId = 11658, sell = 550 },
			{ itemName = "draken wristbands", clientId = 11659, sell = 430 },
			{ itemName = "dream essence egg", clientId = 30005, sell = 205 },
			{ itemName = "dung ball", clientId = 14225, sell = 130 },
			{ itemName = "earflap", clientId = 17819, sell = 40 },
			{ itemName = "elder bonelord tentacle", clientId = 10276, sell = 150 },
			{ itemName = "elven astral observer", clientId = 11465, sell = 90 },
			{ itemName = "elven hoof", clientId = 18994, sell = 115 },
			{ itemName = "elven scouting glass", clientId = 11464, sell = 50 },
			{ itemName = "elvish talisman", clientId = 9635, sell = 45 },
			{ itemName = "emerald tortoise shell", clientId = 39379, sell = 2150 },
			{ itemName = "empty honey glass", clientId = 31331, sell = 270 },
			{ itemName = "enchanted chicken wing", clientId = 5891, sell = 20000 },
			{ itemName = "energy ball", clientId = 23523, sell = 300 },
			{ itemName = "energy vein", clientId = 23508, sell = 270 },
			{ itemName = "ensouled essence", clientId = 32698, sell = 820 },
			{ itemName = "essence of a bad dream", clientId = 10306, sell = 360 },
			{ itemName = "eye of a deepling", clientId = 12730, sell = 150 },
			{ itemName = "eye of a weeper", clientId = 16132, sell = 650 },
			{ itemName = "eyeless devourer legs", clientId = 36776, sell = 650 },
			{ itemName = "eyeless devourer maw", clientId = 36775, sell = 420 },
			{ itemName = "eyeless devourer tongue", clientId = 36777, sell = 900 },
			{ itemName = "eye of corruption", clientId = 11671, sell = 390 },
			{ itemName = "fafnar symbol", clientId = 31443, sell = 950 },
			{ itemName = "fairy wings", clientId = 25694, sell = 200 },
			{ itemName = "falcon crest", clientId = 28823, sell = 650 },
			{ itemName = "fern", clientId = 3737, sell = 20 },
			{ itemName = "fiery heart", clientId = 9636, sell = 375 },
			{ itemName = "fig leaf", clientId = 25742, sell = 200 },
			{ itemName = "figurine of bakragore", clientId = 43963, sell = 5400000 },
			{ itemName = "figurine of cruelty", clientId = 34019, sell = 3100000 },
			{ itemName = "figurine of greed", clientId = 34021, sell = 2900000 },
			{ itemName = "figurine of hatred", clientId = 34020, sell = 2700000 },
			{ itemName = "figurine of malice", clientId = 34018, sell = 2800000 },
			{ itemName = "figurine of megalomania", clientId = 33953, sell = 5000000 },
			{ itemName = "figurine of spite", clientId = 33952, sell = 3000000 },
			{ itemName = "fir cone", clientId = 19111, sell = 25 },
			{ itemName = "fish fin", clientId = 5895, sell = 150 },
			{ itemName = "flask of embalming fluid", clientId = 11466, sell = 30 },
			{ itemName = "flask of warrior's sweat", clientId = 5885, sell = 10000 },
			{ itemName = "flotsam", clientId = 39407, sell = 330 },
			{ itemName = "fox paw", clientId = 27462, sell = 100 },
			{ itemName = "frazzle skin", clientId = 20199, sell = 400 },
			{ itemName = "frazzle tongue", clientId = 20198, sell = 700 },
			{ itemName = "frost giant pelt", clientId = 9658, sell = 160 },
			{ itemName = "frosty ear of a troll", clientId = 9648, sell = 30 },
			{ itemName = "frosty heart", clientId = 9661, sell = 280 },
			{ itemName = "frozen lightning", clientId = 23519, sell = 270 },
			{ itemName = "fur shred", clientId = 34164, sell = 200 },
			{ itemName = "gauze bandage", clientId = 9649, sell = 90 },
			{ itemName = "geomancer's robe", clientId = 11458, sell = 80 },
			{ itemName = "geomancer's staff", clientId = 11463, sell = 120 },
			{ itemName = "ghastly dragon head", clientId = 10449, sell = 700 },
			{ itemName = "ghostly tissue", clientId = 9690, sell = 90 },
			{ itemName = "ghoul snack", clientId = 11467, sell = 60 },
			{ itemName = "giant eye", clientId = 10280, sell = 380 },
			{ itemName = "giant tentacle", clientId = 27619, sell = 10000 },
			{ itemName = "girlish hair decoration", clientId = 11443, sell = 30 },
			{ itemName = "girtabilu warrior carapace", clientId = 36971, sell = 520 },
			{ itemName = "gland", clientId = 8143, sell = 500 },
			{ itemName = "glistening bone", clientId = 23522, sell = 250 },
			{ itemName = "glob of acid slime", clientId = 9054, sell = 25 },
			{ itemName = "glob of mercury", clientId = 9053, sell = 20 },
			{ itemName = "glob of tar", clientId = 9055, sell = 30 },
			{ itemName = "gloom wolf fur", clientId = 22007, sell = 70 },
			{ itemName = "glowing rune", clientId = 28570, sell = 350 },
			{ itemName = "goanna claw", clientId = 31561, sell = 260 },
			{ itemName = "goanna meat", clientId = 31560, sell = 190 },
			{ itemName = "goblet of gloom", clientId = 34022, sell = 12000 },
			{ itemName = "goblin ear", clientId = 11539, sell = 20 },
			{ itemName = "golden brush", clientId = 25689, sell = 250 },
			{ itemName = "golden cheese wedge", clientId = 35581, sell = 6000 },
			{ itemName = "golden dustbin", clientId = 35579, sell = 7000 },
			{ itemName = "golden lotus brooch", clientId = 21974, sell = 270 },
			{ itemName = "golden mask", clientId = 31324, sell = 38000 },
			{ itemName = "golden skull", clientId = 35580, sell = 9000 },
			{ itemName = "goosebump leather", clientId = 20205, sell = 650 },
			{ itemName = "gore horn", clientId = 39377, sell = 2900 },
			{ itemName = "gorerilla mane", clientId = 39392, sell = 2750 },
			{ itemName = "gorerilla tail", clientId = 39393, sell = 2650 },
			{ itemName = "grant of arms", clientId = 28824, sell = 950 },
			{ itemName = "grappling hook", clientId = 35588, sell = 150 },
			{ itemName = "greed's arm", clientId = 33924, sell = 950000 },
			{ itemName = "green bandage", clientId = 25697, sell = 180 },
			{ itemName = "green dragon leather", clientId = 5877, sell = 100 },
			{ itemName = "green dragon scale", clientId = 5920, sell = 100 },
			{ itemName = "green glass plate", clientId = 29346, sell = 180 },
			{ itemName = "green piece of cloth", clientId = 5910, sell = 200 },
			{ itemName = "grimace", clientId = 32593, sell = 120000 },
			{ itemName = "gruesome fan", clientId = 34024, sell = 15000 },
			{ itemName = "guidebook", clientId = 25745, sell = 200 },
			{ itemName = "hair of a banshee", clientId = 11446, sell = 350 },
			{ itemName = "half-digested piece of meat", clientId = 10283, sell = 55 },
			{ itemName = "half-digested stones", clientId = 27369, sell = 40 },
			{ itemName = "half-eaten brain", clientId = 9659, sell = 85 },
			{ itemName = "hand", clientId = 33936, sell = 1450 },
			{ itemName = "hardened bone", clientId = 5925, sell = 70 },
			{ itemName = "harpoon of a giant snail", clientId = 27625, sell = 15000 },
			{ itemName = "hatched rorc egg", clientId = 18997, sell = 30 },
			{ itemName = "haunted piece of wood", clientId = 9683, sell = 115 },
			{ itemName = "hazardous heart", clientId = 34140, sell = 5000 },
			{ itemName = "hazardous robe", clientId = 34147, sell = 3000 },
			{ itemName = "head", clientId = 33937, sell = 3500 },
			{ itemName = "head many", clientId = 33932, sell = 3200 },
			{ itemName = "headpecker beak", clientId = 39387, sell = 2998 },
			{ itemName = "headpecker feather", clientId = 39388, sell = 1300 },
			{ itemName = "heaven blossom", clientId = 3657, sell = 50 },
			{ itemName = "hellhound slobber", clientId = 9637, sell = 500 },
			{ itemName = "hellspawn tail", clientId = 10304, sell = 475 },
			{ itemName = "hemp rope", clientId = 20206, sell = 350 },
			{ itemName = "hideous chunk", clientId = 16140, sell = 510 },
			{ itemName = "high guard flag", clientId = 10415, sell = 550 },
			{ itemName = "high guard shoulderplates", clientId = 10416, sell = 130 },
			{ itemName = "holy ash", clientId = 17850, sell = 160 },
			{ itemName = "holy orchid", clientId = 5922, sell = 90 },
			{ itemName = "honeycomb", clientId = 5902, sell = 40 },
			{ itemName = "horn of kalyassa", clientId = 24941, sell = 10000 },
			{ itemName = "horoscope", clientId = 18926, sell = 40 },
			{ itemName = "huge shell", clientId = 27621, sell = 15000 },
			{ itemName = "huge spiky snail shell", clientId = 27627, sell = 8000 },
			{ itemName = "humongous chunk", clientId = 16139, sell = 540 },
			{ itemName = "hunter's quiver", clientId = 11469, sell = 80 },
			{ itemName = "hydra head", clientId = 10282, sell = 600 },
			{ itemName = "hydrophytes", clientId = 39410, sell = 220 },
			{ itemName = "ice flower", clientId = 30058, sell = 370 },
			{ itemName = "ichgahal's fungal infestation", clientId = 43964, sell = 900000 },
			{ itemName = "incantation notes", clientId = 18929, sell = 90 },
			{ itemName = "infernal heart", clientId = 34139, sell = 2100 },
			{ itemName = "infernal robe", clientId = 34146, sell = 1200 },
			{ itemName = "inkwell", clientId = 28568, sell = 720 },
			{ itemName = "instable proto matter", clientId = 23516, sell = 300 },
			{ itemName = "iron ore", clientId = 5880, sell = 500 },
			{ itemName = "ivory carving", clientId = 33945, sell = 300 },
			{ itemName = "ivory comb", clientId = 32773, sell = 8000 },
			{ itemName = "izcandar's snow globe", clientId = 29944, sell = 180000 },
			{ itemName = "izcandar's sundial", clientId = 29945, sell = 225000 },
			{ itemName = "jagged sickle", clientId = 32595, sell = 150000 },
			{ itemName = "jaws", clientId = 34014, sell = 3900 },
			{ itemName = "jewelled belt", clientId = 11470, sell = 180 },
			{ itemName = "jungle moa claw", clientId = 39404, sell = 160 },
			{ itemName = "jungle moa egg", clientId = 39405, sell = 250 },
			{ itemName = "jungle moa feather", clientId = 39403, sell = 140 },
			{ itemName = "katex' blood", clientId = 34100, sell = 210 },
			{ itemName = "key to the drowned library", clientId = 14009, sell = 330 },
			{ itemName = "kollos shell", clientId = 14077, sell = 420 },
			{ itemName = "kongra's shoulderpad", clientId = 11471, sell = 100 },
			{ itemName = "lamassu hoof", clientId = 31441, sell = 330 },
			{ itemName = "lamassu horn", clientId = 31442, sell = 240 },
			{ itemName = "lancer beetle shell", clientId = 10455, sell = 80 },
			{ itemName = "lancet", clientId = 18925, sell = 90 },
			{ itemName = "lavafungus head", clientId = 36785, sell = 900 },
			{ itemName = "lavafungus ring", clientId = 36786, sell = 390 },
			{ itemName = "lavaworm jaws", clientId = 36771, sell = 1100 },
			{ itemName = "lavaworm spike roots", clientId = 36769, sell = 600 },
			{ itemName = "lavaworm spikes", clientId = 36770, sell = 750 },
			{ itemName = "legionnaire flags", clientId = 10417, sell = 500 },
			{ itemName = "lion cloak patch", clientId = 34162, sell = 190 },
			{ itemName = "liodile fang", clientId = 40583, sell = 480 },
			{ itemName = "lion crest", clientId = 34160, sell = 270 },
			{ itemName = "lion seal", clientId = 34163, sell = 210 },
			{ itemName = "lion's mane", clientId = 9691, sell = 60 },
			{ itemName = "little bowl of myrrh", clientId = 25697, sell = 500 },
			{ itemName = "lizard essence", clientId = 11680, sell = 300 },
			{ itemName = "lizard heart", clientId = 31340, sell = 530 },
			{ itemName = "lizard leather", clientId = 5876, sell = 150 },
			{ itemName = "lizard scale", clientId = 5881, sell = 120 },
			{ itemName = "longing eyes", clientId = 27624, sell = 8000 },
			{ itemName = "lost basher's spike", clientId = 17826, sell = 280 },
			{ itemName = "lost bracers", clientId = 17853, sell = 140 },
			{ itemName = "lost husher's staff", clientId = 17848, sell = 250 },
			{ itemName = "lost soul", clientId = 32227, sell = 120 },
			{ itemName = "luminescent crystal pickaxe", clientId = 32711, sell = 50 },
			{ itemName = "luminous orb", clientId = 11454, sell = 1000 },
			{ itemName = "lump of dirt", clientId = 9692, sell = 10 },
			{ itemName = "lump of earth", clientId = 10305, sell = 130 },
			{ itemName = "mad froth", clientId = 17854, sell = 80 },
			{ itemName = "magic sulphur", clientId = 5904, sell = 8000 },
			{ itemName = "makara fin", clientId = 39401, sell = 350 },
			{ itemName = "makara tongue", clientId = 39402, sell = 320 },
			{ itemName = "malice's horn", clientId = 33920, sell = 620000 },
			{ itemName = "malice's spine", clientId = 33921, sell = 850000 },
			{ itemName = "malofur's lunchbox", clientId = 30088, sell = 240000 },
			{ itemName = "mammoth tusk", clientId = 10321, sell = 100 },
			{ itemName = "mantassin tail", clientId = 11489, sell = 280 },
			{ itemName = "manticore ear", clientId = 31440, sell = 310 },
			{ itemName = "manticore tail", clientId = 31439, sell = 220 },
			{ itemName = "mantosaurus jaw", clientId = 39386, sell = 2998 },
			{ itemName = "marsh stalker beak", clientId = 17461, sell = 65 },
			{ itemName = "marsh stalker feather", clientId = 17462, sell = 50 },
			{ itemName = "maxxenius head", clientId = 29942, sell = 500000 },
			{ itemName = "meat hammer", clientId = 32093, sell = 60 },
			{ itemName = "medal of valiance", clientId = 31591, sell = 410000 },
			{ itemName = "megalomania's essence", clientId = 33928, sell = 1900000 },
			{ itemName = "megalomania's skull", clientId = 33925, sell = 1500000 },
			{ itemName = "mercurial wing", clientId = 39395, sell = 2500 },
			{ itemName = "milk churn", clientId = 32011, sell = 100 },
			{ itemName = "minotaur horn", clientId = 11472, sell = 75 },
			{ itemName = "minotaur leather", clientId = 5878, sell = 80 },
			{ itemName = "miraculum", clientId = 11474, sell = 60 },
			{ itemName = "moon compass", clientId = 43739, sell = 5000 },
			{ itemName = "moon pin", clientId = 43736, sell = 18000 },
			{ itemName = "morbid tapestry", clientId = 34170, sell = 30000 },
			{ itemName = "morshabaal's brain", clientId = 37613, sell = 5000000 },
			{ itemName = "morshabaal's extract", clientId = 37810, sell = 3250000 },
			{ itemName = "mould heart", clientId = 34141, sell = 2100 },
			{ itemName = "mould robe", clientId = 34148, sell = 1200 },
			{ itemName = "mouldy powder", clientId = 35596, sell = 200 },
			{ itemName = "mr. punish's handcuffs", clientId = 6537, sell = 50000 },
			{ itemName = "murcion's mycelium", clientId = 43965, sell = 950000 },
			{ itemName = "mutated bat ear", clientId = 9662, sell = 420 },
			{ itemName = "mutated flesh", clientId = 10308, sell = 50 },
			{ itemName = "mutated rat tail", clientId = 9668, sell = 150 },
			{ itemName = "mystical hourglass", clientId = 9660, sell = 700 },
			{ itemName = "naga archer scales", clientId = 39413, sell = 340 },
			{ itemName = "naga arming", clientId = 39411, sell = 390 },
			{ itemName = "naga earring", clientId = 39412, sell = 380 },
			{ itemName = "naga warrior scales", clientId = 39414, sell = 340 },
			{ itemName = "necromantic robe", clientId = 11475, sell = 250 },
			{ itemName = "nettle blossom", clientId = 10314, sell = 75 },
			{ itemName = "nettle spit", clientId = 11476, sell = 25 },
			{ itemName = "nighthuner wing", clientId = 39381, sell = 2000 },
			{ itemName = "noble amulet", clientId = 31595, sell = 430000 },
			{ itemName = "noble cape", clientId = 31593, sell = 425000 },
			{ itemName = "noble turban", clientId = 11486, sell = 430 },
			{ itemName = "nose ring", clientId = 5804, sell = 2000 },
			{ itemName = "odd organ", clientId = 23510, sell = 410 },
			{ itemName = "ogre ear stud", clientId = 22188, sell = 180 },
			{ itemName = "ogre nose ring", clientId = 22189, sell = 210 },
			{ itemName = "old girtablilu carapace", clientId = 36972, sell = 570 },
			{ itemName = "old royal diary", clientId = 36808, sell = 220000 },
			{ itemName = "one of timira's many heads", clientId = 39399, sell = 215000 },
			{ itemName = "orc leather", clientId = 11479, sell = 30 },
			{ itemName = "orc tooth", clientId = 10196, sell = 150 },
			{ itemName = "orcish gear", clientId = 11477, sell = 85 },
			{ itemName = "pair of hellflayer horns", clientId = 22729, sell = 1300 },
			{ itemName = "pair of old bracers", clientId = 32705, sell = 500 },
			{ itemName = "pale worm's scalp", clientId = 32598, sell = 489000 },
			{ itemName = "parder fur", clientId = 39418, sell = 150 },
			{ itemName = "parder tooth", clientId = 39417, sell = 150 },
			{ itemName = "patch of fine cloth", clientId = 28821, sell = 1350 },
			{ itemName = "peacock feather fan", clientId = 21975, sell = 350 },
			{ itemName = "pelvis bone", clientId = 11481, sell = 30 },
			{ itemName = "percht horns", clientId = 30186, sell = 200 },
			{ itemName = "perfect behemoth fang", clientId = 5893, sell = 250 },
			{ itemName = "petrified scream", clientId = 10420, sell = 250 },
			{ itemName = "phantasmal hair", clientId = 32704, sell = 500 },
			{ itemName = "piece of archer armor", clientId = 11483, sell = 20 },
			{ itemName = "piece of crocodile leather", clientId = 10279, sell = 15 },
			{ itemName = "piece of dead brain", clientId = 9663, sell = 420 },
			{ itemName = "piece of massacre's shell", clientId = 6540, sell = 50000 },
			{ itemName = "piece of scarab shell", clientId = 9641, sell = 45 },
			{ itemName = "piece of swampling wood", clientId = 17823, sell = 30 },
			{ itemName = "piece of timira's sensors", clientId = 39400, sell = 150000 },
			{ itemName = "piece of warrior armor", clientId = 11482, sell = 50 },
			{ itemName = "pieces of magic chalk", clientId = 18930, sell = 210 },
			{ itemName = "pig foot", clientId = 9693, sell = 10 },
			{ itemName = "pile of grave earth", clientId = 11484, sell = 25 },
			{ itemName = "pirat's tail", clientId = 35573, sell = 180 },
			{ itemName = "pirate coin", clientId = 35572, sell = 110 },
			{ itemName = "plagueroot offshoot", clientId = 30087, sell = 280000 },
			{ itemName = "plasma pearls", clientId = 23506, sell = 250 },
			{ itemName = "plasmatic lightning", clientId = 23520, sell = 270 },
			{ itemName = "poison gland", clientId = 29348, sell = 210 },
			{ itemName = "poison spider shell", clientId = 11485, sell = 10 },
			{ itemName = "poisonous slime", clientId = 9640, sell = 50 },
			{ itemName = "polar bear paw", clientId = 9650, sell = 30 },
			{ itemName = "pool of chitinous glue", clientId = 20207, sell = 480 },
			{ itemName = "porcelain mask", clientId = 25088, sell = 2000 },
			{ itemName = "powder herb", clientId = 3739, sell = 10 },
			{ itemName = "prehemoth claw", clientId = 39383, sell = 2300 },
			{ itemName = "prehemoth horns", clientId = 39382, sell = 3000 },
			{ itemName = "pristine worm head", clientId = 27618, sell = 15000 },
			{ itemName = "protective charm", clientId = 11444, sell = 60 },
			{ itemName = "purified soul", clientId = 32228, sell = 260 },
			{ itemName = "purple robe", clientId = 11473, sell = 110 },

			--{ itemName = "putrefactive figurine", clientId = , sell = 3200000 },
			{ itemName = "quara bone", clientId = 11491, sell = 500 },
			{ itemName = "quara eye", clientId = 11488, sell = 350 },
			{ itemName = "quara pincers", clientId = 11490, sell = 410 },
			{ itemName = "quara tentacle", clientId = 11487, sell = 140 },
			{ itemName = "quill", clientId = 28567, sell = 1100 },
			{ itemName = "rare earth", clientId = 27301, sell = 80 },
			{ itemName = "ratmiral's hat", clientId = 35613, sell = 150000 },
			{ itemName = "ravenous circlet", clientId = 32597, sell = 220000 },
			{ itemName = "red dragon leather", clientId = 5948, sell = 200 },
			{ itemName = "red dragon scale", clientId = 5882, sell = 200 },
			{ itemName = "red goanna scale", clientId = 31558, sell = 270 },
			{ itemName = "red hair dye", clientId = 17855, sell = 40 },
			{ itemName = "red piece of cloth", clientId = 5911, sell = 300 },
			{ itemName = "rhindeer antlers", clientId = 40587, sell = 680 },
			{ itemName = "rhino hide", clientId = 24388, sell = 175 },
			{ itemName = "rhino horn", clientId = 24389, sell = 265 },
			{ itemName = "rhino horn carving", clientId = 24386, sell = 300 },
			{ itemName = "ripptor claw", clientId = 39389, sell = 2000 },
			{ itemName = "ripptor scales", clientId = 39391, sell = 1200 },
			{ itemName = "rod", clientId = 33929, sell = 2200 },
			{ itemName = "rogue naga scales", clientId = 39416, sell = 570 },
			{ itemName = "roots", clientId = 33938, sell = 1200 },
			{ itemName = "rope belt", clientId = 11492, sell = 66 },
			{ itemName = "rorc egg", clientId = 18996, sell = 120 },
			{ itemName = "rorc feather", clientId = 18993, sell = 70 },
			{ itemName = "rotten heart", clientId = 31589, sell = 74000 },
			{ itemName = "rotten piece of cloth", clientId = 10291, sell = 30 },
			{ itemName = "rotten vermin ichor", clientId = 43849, sell = 4500 },
			{ itemName = "rotten roots", clientId = 43849, sell = 3800 },
			{ itemName = "sabretooth", clientId = 10311, sell = 400 },
			{ itemName = "sabretooth fur", clientId = 39378, sell = 2500 },
			{ itemName = "safety pin", clientId = 11493, sell = 120 },
			{ itemName = "sample of monster blood", clientId = 27874, sell = 250 },
			{ itemName = "sandcrawler shell", clientId = 10456, sell = 20 },
			{ itemName = "scale of corruption", clientId = 11673, sell = 680 },
			{ itemName = "scale of gelidrazah", clientId = 24939, sell = 10000 },
			{ itemName = "scarab pincers", clientId = 9631, sell = 280 },
			{ itemName = "scorpion tail", clientId = 9651, sell = 25 },
			{ itemName = "scroll of heroic deeds", clientId = 11510, sell = 230 },
			{ itemName = "scythe leg", clientId = 10312, sell = 450 },
			{ itemName = "sea horse figurine", clientId = 31323, sell = 42000 },
			{ itemName = "sea serpent scale", clientId = 9666, sell = 520 },
			{ itemName = "seeds", clientId = 647, sell = 150 },
			{ itemName = "shaggy tail", clientId = 10407, sell = 25 },
			{ itemName = "shamanic hood", clientId = 11478, sell = 45 },
			{ itemName = "shamanic talisman", clientId = 22184, sell = 200 },
			{ itemName = "shark fins", clientId = 35574, sell = 250 },
			{ itemName = "shimmering beetles", clientId = 25686, sell = 150 },
			{ itemName = "sight of surrender's eye", clientId = 20183, sell = 3000 },
			{ itemName = "signet ring", clientId = 31592, sell = 480000 },
			{ itemName = "silencer claws", clientId = 20200, sell = 390 },
			{ itemName = "silencer resonating chamber", clientId = 20201, sell = 600 },
			{ itemName = "silken bookmark", clientId = 28566, sell = 1300 },
			{ itemName = "silky fur", clientId = 10292, sell = 35 },
			{ itemName = "silver foxmouse coin", clientId = 43733, sell = 11000 },
			{ itemName = "silver moon coin", clientId = 43732, sell = 11000 },
			{ itemName = "silver hand mirror", clientId = 32772, sell = 10000 },
			{ itemName = "single human eye", clientId = 25696, sell = 1000 },
			{ itemName = "skeleton decoration", clientId = 6525, sell = 3000 },
			{ itemName = "skull belt", clientId = 11480, sell = 80 },
			{ itemName = "skull fetish", clientId = 22191, sell = 250 },
			{ itemName = "skull shatterer", clientId = 17849, sell = 170 },
			{ itemName = "skunk tail", clientId = 10274, sell = 50 },
			{ itemName = "slimy leg", clientId = 27623, sell = 4500 },
			{ itemName = "small energy ball", clientId = 23524, sell = 250 },
			{ itemName = "small flask of eyedrops", clientId = 11512, sell = 95 },
			{ itemName = "small notebook", clientId = 11450, sell = 480 },
			{ itemName = "small oil lamp", clientId = 2933, sell = 150 },
			{ itemName = "small pitchfork", clientId = 11513, sell = 70 },
			{ itemName = "small treasure chest", clientId = 35571, sell = 500 },
			{ itemName = "small tropical fish", clientId = 39408, sell = 380 },
			{ itemName = "smoldering eye", clientId = 39543, sell = 470000 },
			{ itemName = "snake skin", clientId = 9694, sell = 400 },
			{ itemName = "sniper gloves", clientId = 5875, sell = 2000 },
			{ itemName = "solid rage", clientId = 23517, sell = 310 },
			{ itemName = "some grimeleech wings", clientId = 22730, sell = 1200 },
			{ itemName = "soul stone", clientId = 5809, sell = 6000 },
			{ itemName = "spark sphere", clientId = 23518, sell = 350 },
			{ itemName = "sparkion claw", clientId = 23502, sell = 290 },
			{ itemName = "sparkion legs", clientId = 23504, sell = 310 },
			{ itemName = "sparkion stings", clientId = 23505, sell = 280 },
			{ itemName = "sparkion tail", clientId = 23503, sell = 300 },
			{ itemName = "spectral gold nugget", clientId = 32724, sell = 500 },
			{ itemName = "spectral silver nugget", clientId = 32725, sell = 250 },
			{ itemName = "spellsinger's seal", clientId = 14008, sell = 280 },
			{ itemName = "sphinx feather", clientId = 31437, sell = 470 },
			{ itemName = "sphinx tiara", clientId = 31438, sell = 360 },
			{ itemName = "spider fangs", clientId = 8031, sell = 10 },
			{ itemName = "spider silk", clientId = 5879, sell = 100 },
			{ itemName = "spidris mandible", clientId = 14082, sell = 450 },
			{ itemName = "spiked iron ball", clientId = 10408, sell = 100 },
			{ itemName = "spirit container", clientId = 5884, sell = 40000 },
			{ itemName = "spite's spirit", clientId = 33926, sell = 840000 },
			{ itemName = "spitter nose", clientId = 14078, sell = 340 },
			{ itemName = "spooky blue eye", clientId = 9642, sell = 95 },
			{ itemName = "srezz' eye", clientId = 34103, sell = 300 },
			{ itemName = "stalking seeds", clientId = 39384, sell = 1800 },
			{ itemName = "star herb", clientId = 3736, sell = 15 },
			{ itemName = "stone herb", clientId = 3735, sell = 20 },
			{ itemName = "stone wing", clientId = 10278, sell = 120 },
			{ itemName = "stonerefiner's skull", clientId = 27606, sell = 100 },
			{ itemName = "strand of medusa hair", clientId = 10309, sell = 600 },
			{ itemName = "strange proto matter", clientId = 23513, sell = 300 },
			{ itemName = "strange symbol", clientId = 3058, sell = 200 },
			{ itemName = "streaked devourer eyes", clientId = 36772, sell = 500 },
			{ itemName = "streaked devourer legs", clientId = 36774, sell = 600 },
			{ itemName = "streaked devourer maw", clientId = 36773, sell = 400 },
			{ itemName = "striped fur", clientId = 10293, sell = 50 },
			{ itemName = "sulphider shell", clientId = 39375, sell = 2200 },
			{ itemName = "sulphur powder", clientId = 39376, sell = 1900 },
			{ itemName = "sun brooch", clientId = 43737, sell = 18000 },
			{ itemName = "swamp grass", clientId = 9686, sell = 20 },
			{ itemName = "swampling moss", clientId = 17822, sell = 20 },
			{ itemName = "swarmer antenna", clientId = 14076, sell = 130 },
			{ itemName = "tail of corruption", clientId = 11672, sell = 240 },
			{ itemName = "tarantula egg", clientId = 10281, sell = 80 },
			{ itemName = "tarnished rhino figurine", clientId = 24387, sell = 320 },
			{ itemName = "tattered piece of robe", clientId = 9684, sell = 120 },
			{ itemName = "telescope eye", clientId = 33934, sell = 1600 },
			{ itemName = "tentacle of tentugly", clientId = 35611, sell = 27000 },
			{ itemName = "tentacle piece", clientId = 11666, sell = 5000 },
			{ itemName = "tentugly's eye", clientId = 35610, sell = 52000 },
			{ itemName = "tentugly's jaws", clientId = 35612, sell = 80000 },
			{ itemName = "terramite eggs", clientId = 10453, sell = 50 },
			{ itemName = "terramite legs", clientId = 10454, sell = 60 },
			{ itemName = "terramite shell", clientId = 10452, sell = 170 },
			{ itemName = "terrorbird beak", clientId = 10273, sell = 95 },
			{ itemName = "the handmaiden's protector", clientId = 6539, sell = 50000 },
			{ itemName = "the imperor's trident", clientId = 6534, sell = 50000 },
			{ itemName = "the plasmother's remains", clientId = 6535, sell = 50000 },
			{ itemName = "thick fur", clientId = 10307, sell = 150 },
			{ itemName = "thorn", clientId = 9643, sell = 100 },
			{ itemName = "tiara", clientId = 35578, sell = 11000 },
			{ itemName = "token of love", clientId = 31594, sell = 440000 },
			{ itemName = "tooth file", clientId = 18924, sell = 60 },
			{ itemName = "tooth of tazhadur", clientId = 24940, sell = 10000 },
			{ itemName = "torn shirt", clientId = 25744, sell = 250 },
			{ itemName = "trapped bad dream monster", clientId = 20203, sell = 900 },
			{ itemName = "tremendous tyrant head", clientId = 36783, sell = 930 },
			{ itemName = "tremendous tyrant shell", clientId = 36784, sell = 740 },
			{ itemName = "troll green", clientId = 3741, sell = 25 },
			{ itemName = "trollroot", clientId = 11515, sell = 50 },
			{ itemName = "tunnel tyrant head", clientId = 27595, sell = 500 },
			{ itemName = "tunnel tyrant shell", clientId = 27596, sell = 700 },
			{ itemName = "turtle shell", clientId = 5899, sell = 90 },
			{ itemName = "tusk", clientId = 3044, sell = 100 },
			{ itemName = "two-headed turtle heads", clientId = 39409, sell = 460 },
			{ itemName = "undead heart", clientId = 10450, sell = 200 },
			{ itemName = "undertaker fangs", clientId = 39380, sell = 2700 },
			{ itemName = "unholy bone", clientId = 10316, sell = 480 },
			{ itemName = "urmahlullus mane", clientId = 31623, sell = 490000 },
			{ itemName = "urmahlullus paws", clientId = 31624, sell = 245000 },
			{ itemName = "urmahlullus tail", clientId = 31622, sell = 210000 },
			{ itemName = "utua's poison", clientId = 34101, sell = 230 },
			{ itemName = "vampire dust", clientId = 5905, sell = 100 },
			{ itemName = "vampire teeth", clientId = 9685, sell = 275 },
			{ itemName = "vampire's cape chain", clientId = 18927, sell = 150 },
			{ itemName = "varnished diremaw brainpan", clientId = 36781, sell = 750 },
			{ itemName = "varnished diremaw legs", clientId = 36782, sell = 670 },
			{ itemName = "veal", clientId = 32009, sell = 40 },

			--{ itemName = "vemiath's infused basalt", clientId = , sell = 1000000 },
			{ itemName = "venison", clientId = 18995, sell = 55 },
			{ itemName = "vexclaw talon", clientId = 22728, sell = 1100 },
			{ itemName = "vial of hatred", clientId = 33927, sell = 737000 },
			{ itemName = "vibrant heart", clientId = 34143, sell = 2100 },
			{ itemName = "vibrant robe", clientId = 34144, sell = 1200 },
			{ itemName = "violet glass plate", clientId = 29347, sell = 2150 },
			{ itemName = "volatile proto matter", clientId = 23514, sell = 300 },
			{ itemName = "warmaster's wristguards", clientId = 10405, sell = 200 },
			{ itemName = "warwolf fur", clientId = 10318, sell = 30 },
			{ itemName = "waspoid claw", clientId = 14080, sell = 320 },
			{ itemName = "waspoid wing", clientId = 14081, sell = 190 },
			{ itemName = "weaver's wandtip", clientId = 10397, sell = 250 },
			{ itemName = "werebadger claws", clientId = 22051, sell = 160 },
			{ itemName = "werebadger skull", clientId = 22055, sell = 185 },
			{ itemName = "werebear fur", clientId = 22057, sell = 85 },
			{ itemName = "werebear skull", clientId = 22056, sell = 195 },
			{ itemName = "wereboar hooves", clientId = 22053, sell = 175 },
			{ itemName = "wereboar tusks", clientId = 22054, sell = 165 },
			{ itemName = "werecrocodile tongue", clientId = 43729, sell = 570 },
			{ itemName = "werefox tail", clientId = 27463, sell = 200 },
			{ itemName = "werehyaena nose", clientId = 33943, sell = 220 },
			{ itemName = "werehyaena talisman", clientId = 33944, sell = 350 },
			{ itemName = "werepanther claw", clientId = 43731, sell = 280 },
			{ itemName = "werewolf fangs", clientId = 22052, sell = 180 },
			{ itemName = "werewolf fur", clientId = 10317, sell = 380 },
			{ itemName = "white piece of cloth", clientId = 5909, sell = 100 },
			{ itemName = "widow's mandibles", clientId = 10411, sell = 110 },
			{ itemName = "wild flowers", clientId = 25691, sell = 120 },
			{ itemName = "wimp tooth chain", clientId = 17847, sell = 120 },
			{ itemName = "winged tail", clientId = 10313, sell = 800 },
			{ itemName = "winter wolf fur", clientId = 10295, sell = 20 },
			{ itemName = "witch broom", clientId = 9652, sell = 60 },
			{ itemName = "withered pauldrons", clientId = 27607, sell = 850 },
			{ itemName = "withered scalp", clientId = 27608, sell = 900 },
			{ itemName = "wolf paw", clientId = 5897, sell = 70 },
			{ itemName = "wood", clientId = 5901, sell = 5 },
			{ itemName = "wool", clientId = 10319, sell = 15 },
			{ itemName = "worm sponge", clientId = 43848, sell = 4200 },
			{ itemName = "writhing brain", clientId = 32600, sell = 370000 },
			{ itemName = "writhing heart", clientId = 32599, sell = 185000 },
			{ itemName = "wyrm scale", clientId = 9665, sell = 400 },
			{ itemName = "wyvern talisman", clientId = 9644, sell = 265 },
			{ itemName = "yellow piece of cloth", clientId = 5914, sell = 150 },
			{ itemName = "yielowax", clientId = 12742, sell = 600 },
			{ itemName = "yirkas' egg", clientId = 34102, sell = 280 },
			{ itemName = "young lich worm", clientId = 31590, sell = 25000 },
			{ itemName = "zaogun flag", clientId = 10413, sell = 600 },
			{ itemName = "zaogun shoulderplates", clientId = 10414, sell = 150 },
			{ itemName = "watermelon tourmaline", clientId = 33780, sell = 230000 },

			-- Valindara
			{ itemName = "watermelon tourmaline", clientId = 33779, sell = 30000 },
			{ itemName = "amber with a bug", clientId = 32624, sell = 41000 },
			{ itemName = "amber with a dragonfly", clientId = 32625, sell = 56000 },
			{ itemName = "amber", clientId = 32626, sell = 20000 },
			{ itemName = "bar of gold", clientId = 14112, sell = 10000 },
			{ itemName = "black pearl", clientId = 3027, sell = 280 },
			{ itemName = "blue crystal shard", clientId = 16119, sell = 1500 },
			{ itemName = "blue crystal splinter", clientId = 16124, sell = 400 },
			{ itemName = "blue rose", clientId = 3659, sell = 200 },
			{ itemName = "bronze goblet", clientId = 5807 },
			{ itemName = "brown crystal splinter", clientId = 16123, sell = 400 },
			{ itemName = "brown giant shimmering pearl", clientId = 282, sell = 3000 },
			{ itemName = "butterfly ring", clientId = 25698, sell = 2000 },
			{ itemName = "colourful snail shell", clientId = 25696, sell = 250 },
			{ itemName = "coral brooch", clientId = 24391, sell = 750 },
			{ itemName = "crunor idol", clientId = 30055, sell = 30000 },
			{ itemName = "cyan crystal fragment", clientId = 16125, sell = 800 },
			{ itemName = "dandelion seeds", clientId = 25695, sell = 200 },
			{ itemName = "diamond", clientId = 32770, sell = 15000 },
			{ itemName = "dragon figurine", clientId = 30053, sell = 45000 },
			{ itemName = "dream blossom staff", clientId = 25700, sell = 5000 },
			{ itemName = "empty potion flask", clientId = 283, sell = 5 },
			{ itemName = "empty potion flask", clientId = 284, sell = 5 },
			{ itemName = "empty potion flask", clientId = 285, sell = 5 },
			{ itemName = "fairy wings", clientId = 25694, sell = 200 },
			{ itemName = "fern", clientId = 3737, sell = 20 },
			{ itemName = "fireball rune", clientId = 3189, buy = 30 },
			{ itemName = "gemmed figurine", clientId = 24392, sell = 3500 },
			{ itemName = "giant amethyst", clientId = 32622, sell = 60000 },
			{ itemName = "giant emerald", clientId = 30060, sell = 90000 },
			{ itemName = "giant ruby", clientId = 30059, sell = 70000 },
			{ itemName = "giant sapphire", clientId = 30061, sell = 50000 },
			{ itemName = "giant topaz", clientId = 32623, sell = 80000 },
			{ itemName = "goat grass", clientId = 3674, sell = 50 },
			{ itemName = "gold ingot", clientId = 9058, sell = 5000 },
			{ itemName = "gold nugget", clientId = 3040, sell = 850 },
			{ itemName = "golden figurine", clientId = 5799, sell = 3000 },
			{ itemName = "great health potion", clientId = 239, buy = 225 },
			{ itemName = "great mana potion", clientId = 238, buy = 144 },
			{ itemName = "great spirit potion", clientId = 7642, buy = 228 },
			{ itemName = "green crystal fragment", clientId = 16127, sell = 800 },
			{ itemName = "green crystal shard", clientId = 16121, sell = 1500 },
			{ itemName = "green crystal splinter", clientId = 16122, sell = 400 },
			{ itemName = "green giant shimmering pearl", clientId = 281, sell = 3000 },
			{ itemName = "mandrake", clientId = 5014, sell = 5000 },
			{ itemName = "moonstone", clientId = 32771, sell = 13000 },
			{ itemName = "mystic gem", clientId = 44612, sell = 5000 },
			{ itemName = "onyx chip", clientId = 22193, sell = 500 },
			{ itemName = "opal", clientId = 22194, sell = 500 },
			{ itemName = "ornate lion figurine", clientId = 33781, sell = 10000 },
			{ itemName = "ornate locket", clientId = 30056, sell = 18000 },
			{ itemName = "panpipes", clientId = 2953, sell = 150 },
			{ itemName = "powder herb", clientId = 3739, sell = 10 },
			{ itemName = "prismatic quartz", clientId = 24962, sell = 450 },
			{ itemName = "rainbow quartz", clientId = 25737, sell = 500 },
			{ itemName = "red crystal fragment", clientId = 16126, sell = 800 },
			{ itemName = "red rose", clientId = 3658, sell = 10 },
			{ itemName = "shimmering beetles", clientId = 25693, sell = 150 },
			{ itemName = "skull coin", clientId = 32583, sell = 12000 },
			{ itemName = "sling herb", clientId = 3738, sell = 10 },
			{ itemName = "small amethyst", clientId = 3033, sell = 200 },
			{ itemName = "small diamond", clientId = 3028, sell = 300 },
			{ itemName = "small emerald", clientId = 3032, sell = 250 },
			{ itemName = "small enchanted amethyst", clientId = 678, sell = 200 },
			{ itemName = "small enchanted emerald", clientId = 677, sell = 250 },
			{ itemName = "small enchanted ruby", clientId = 676, sell = 250 },
			{ itemName = "small enchanted sapphire", clientId = 675, sell = 250 },
			{ itemName = "small ruby", clientId = 3030, sell = 250 },
			{ itemName = "small sapphire", clientId = 3029, sell = 250 },
			{ itemName = "small topaz", clientId = 9057, sell = 200 },
			{ itemName = "soulfire rune", clientId = 3195, buy = 46 },
			{ itemName = "star herb", clientId = 3736, sell = 15 },
			{ itemName = "stone herb", clientId = 3735, sell = 20 },
			{ itemName = "strong health potion", clientId = 236, buy = 115 },
			{ itemName = "strong mana potion", clientId = 237, buy = 93 },
			{ itemName = "sudden death rune", clientId = 3155, buy = 135 },
			{ itemName = "summer dress", clientId = 8046, sell = 1500 },
			{ itemName = "supreme health potion", clientId = 23375, buy = 625 },
			{ itemName = "thunderstorm rune", clientId = 3202, buy = 47 },
			{ itemName = "tiger eye", clientId = 24961, sell = 350 },
			{ itemName = "ultimate healing rune", clientId = 3160, buy = 175 },
			{ itemName = "ultimate health potion", clientId = 7643, buy = 379 },
			{ itemName = "ultimate mana potion", clientId = 23373, buy = 438 },
			{ itemName = "ultimate spirit potion", clientId = 23374, buy = 438 },
			{ itemName = "unicorn figurine", clientId = 30054, sell = 50000 },
			{ itemName = "vial", clientId = 2874, sell = 5 },
			{ itemName = "violet crystal shard", clientId = 16120, sell = 1500 },
			{ itemName = "watermelon tourmaline", clientId = 33780, sell = 230000 },
			{ itemName = "wedding ring", clientId = 3004, sell = 100 },
			{ itemName = "white gem", clientId = 32769, sell = 12000 },
			{ itemName = "white pearl", clientId = 3026, sell = 160 },
			{ itemName = "white silk flower", clientId = 34008, sell = 9000 },
			{ itemName = "wild flowers", clientId = 25691, sell = 120 },
			{ itemName = "wood cape", clientId = 3575, sell = 5000 },
			{ itemName = "wooden spellbook", clientId = 25699, sell = 12000 },
		},
	}

	local playerImbuementData = {}
	local function addItemsToShoppingBag(npc, player)
		local playerId = player:getId()
		local playerData = playerImbuementData[playerId]

		if playerData then
			local moneyRequired = playerData.moneyRequired
			local itemList = playerData.itemList
			if player:getMoney() + player:getBankBalance() < moneyRequired then
				npcHandler:say("Sorry, you don't have enough money", npc, player)
				npcHandler:setTopic(player:getId(), 0)
				return false, "You don't have enough money."
			end

			local totalWeight = 0
			for _, item in pairs(itemList) do
				local itemType = ItemType(item.itemId)
				totalWeight = totalWeight + (itemType:getWeight() * item.count)
			end

			if player:getFreeCapacity() < totalWeight then
				return false, "You don't have enough weight."
			end

			if player:getFreeBackpackSlots() == 0 then
				return false, "You don't have enough room."
			end

			local shoppingBag = player:addItem(2856, 1) -- present box
			for _, item in pairs(itemList) do
				shoppingBag:addItem(item.itemId, item.count)
			end

			player:removeMoneyBank(moneyRequired)

			return true
		end

		return false
	end

	local imbuementPackagesData = {
		-- Skill increase packages
		["bash"] = {
			text = "skill club",
			moneyRequired = 6250,
			itemList = {
				{ itemId = 9657, count = 20 }, -- cyclops toe
				{ itemId = 22189, count = 15 }, -- ogre nose ring
				{ itemId = 10405, count = 10 }, -- warmaster's wristguards
			},
		},
		["blockade"] = {
			text = "skill shield",
			moneyRequired = 16150,
			itemList = {
				{ itemId = 9641, count = 20 }, -- piece of scarab shell
				{ itemId = 11703, count = 25 }, -- brimstone shell
				{ itemId = 20199, count = 25 }, -- frazzle skin
			},
		},
		["chop"] = {
			text = "skill axe",
			moneyRequired = 13050,
			itemList = {
				{ itemId = 10196, count = 20 }, -- orc tooth
				{ itemId = 11447, count = 25 }, -- battle stone
				{ itemId = 21200, count = 20 }, -- moohtant horn
			},
		},
		["epiphany"] = {
			text = "magic level",
			moneyRequired = 10650,
			itemList = {
				{ itemId = 9635, count = 25 }, -- elvish talisman
				{ itemId = 11452, count = 15 }, -- broken shamanic staff
				{ itemId = 10309, count = 15 }, -- strand of medusa hair
			},
		},
		["precision"] = {
			text = "skill distance",
			moneyRequired = 6750,
			itemList = {
				{ itemId = 11464, count = 25 }, -- elven scouting glass
				{ itemId = 18994, count = 20 }, -- elven hoof
				{ itemId = 10298, count = 10 }, -- metal spike
			},
		},
		["slash"] = {
			text = "skill sword",
			moneyRequired = 6550,
			itemList = {
				{ itemId = 9691, count = 25 }, -- lion's mane
				{ itemId = 21202, count = 25 }, -- mooh'tah shell
				{ itemId = 9654, count = 5 }, -- war crystal
			},
		},
		-- Additional attributes packages
		["featherweight"] = {
			text = "capacity increase",
			moneyRequired = 12250,
			itemList = {
				{ itemId = 25694, count = 20 }, -- fairy wings
				{ itemId = 25702, count = 10 }, -- little bowl of myrrh
				{ itemId = 20205, count = 5 }, -- goosebump leather
			},
		},
		["strike"] = {
			text = "critical",
			moneyRequired = 16700,
			itemList = {
				{ itemId = 11444, count = 20 }, -- protective charm
				{ itemId = 10311, count = 25 }, -- sabretooth
				{ itemId = 22728, count = 5 }, -- vexclaw talon
			},
		},
		["swiftness"] = {
			text = "speed",
			moneyRequired = 5225,
			itemList = {
				{ itemId = 17458, count = 15 }, -- damselfly wing
				{ itemId = 10302, count = 25 }, -- compass
				{ itemId = 14081, count = 20 }, -- waspoid wing
			},
		},
		["vampirism"] = {
			text = "life leech",
			moneyRequired = 10475,
			itemList = {
				{ itemId = 9685, count = 25 }, -- vampire teeth
				{ itemId = 9633, count = 15 }, -- bloody pincers
				{ itemId = 9663, count = 5 }, -- piece of dead brain
			},
		},
		["vibrancy"] = {
			text = "paralysis removal",
			moneyRequired = 15000,
			itemList = {
				{ itemId = 22053, count = 20 }, -- wereboar hooves
				{ itemId = 23507, count = 15 }, -- crystallized anger
				{ itemId = 28567, count = 5 }, -- quill
			},
		},
		["void"] = {
			text = "mana leech",
			moneyRequired = 17400,
			itemList = {
				{ itemId = 11492, count = 25 }, -- rope belt
				{ itemId = 20200, count = 25 }, -- silencer claws
				{ itemId = 22730, count = 5 }, -- some grimeleech wings
			},
		},
		-- Elemental damage packages
		["electrify"] = {
			text = "energy damage",
			moneyRequired = 3770,
			itemList = {
				{ itemId = 18993, count = 25 }, -- rorc feather
				{ itemId = 21975, count = 5 }, -- peacock feather fan
				{ itemId = 23508, count = 1 }, -- energy vein
			},
		},
		["frost"] = {
			text = "ice damage",
			moneyRequired = 9750,
			itemList = {
				{ itemId = 9661, count = 25 }, -- frosty heart
				{ itemId = 21801, count = 10 }, -- seacrest hair
				{ itemId = 9650, count = 5 }, -- polar bear paw
			},
		},
		["reap"] = {
			text = "death damage",
			moneyRequired = 3475,
			itemList = {
				{ itemId = 11484, count = 25 }, -- pile of grave earth
				{ itemId = 9647, count = 20 }, -- demonic skeletal hand
				{ itemId = 10420, count = 5 }, -- petrified scream
			},
		},
		["scorch"] = {
			text = "fire damage",
			moneyRequired = 15875,
			itemList = {
				{ itemId = 9636, count = 25 }, -- fiery heart
				{ itemId = 5920, count = 5 }, -- green dragon scale
				{ itemId = 5954, count = 5 }, -- demon horn
			},
		},
		["venom"] = {
			text = "earth damage",
			moneyRequired = 1820,
			itemList = {
				{ itemId = 9686, count = 25 }, -- swamp grass
				{ itemId = 9640, count = 20 }, -- poisonous slime
				{ itemId = 21194, count = 2 }, -- slime heart
			},
		},
		-- Elemental protection packages
		["cloud fabric"] = {
			text = "energy protection",
			moneyRequired = 13775,
			itemList = {
				{ itemId = 9644, count = 20 }, -- wyvern talisman
				{ itemId = 14079, count = 15 }, -- crawler head plating
				{ itemId = 9665, count = 10 }, -- wyrm scale
			},
		},
		["demon presence"] = {
			text = "holy protection",
			moneyRequired = 20250,
			itemList = {
				{ itemId = 9639, count = 25 }, -- cultish robe
				{ itemId = 9638, count = 25 }, -- cultish mask
				{ itemId = 10304, count = 20 }, -- hellspawn tail
			},
		},
		["dragon hide"] = {
			text = "fire protection",
			moneyRequired = 10850,
			itemList = {
				{ itemId = 5877, count = 20 }, -- green dragon leather
				{ itemId = 16131, count = 10 }, -- blazing bone
				{ itemId = 11658, count = 5 }, -- draken sulphur
			},
		},
		["lich shroud"] = {
			text = "death protection",
			moneyRequired = 5650,
			itemList = {
				{ itemId = 11466, count = 25 }, -- flask of embalming fluid
				{ itemId = 22007, count = 20 }, -- gloom wolf fur
				{ itemId = 9660, count = 5 }, -- mystical hourglass
			},
		},
		["quara scale"] = {
			text = "ice protection",
			moneyRequired = 3650,
			itemList = {
				{ itemId = 10295, count = 25 }, -- winter wolf fur
				{ itemId = 10307, count = 15 }, -- thick fur
				{ itemId = 14012, count = 10 }, -- deepling warts
			},
		},
		["snake skin"] = {
			text = "earth protection",
			moneyRequired = 12550,
			itemList = {
				{ itemId = 17823, count = 25 }, -- piece of swampling wood
				{ itemId = 9694, count = 20 }, -- snake skin
				{ itemId = 11702, count = 10 }, -- brimstone fangs
			},
		},
	}

	-- On buy npc shop message
	npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
		npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
	end
	-- On sell npc shop message
	npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
		player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
	end
	-- On check npc shop message (look item)
	npcType.onCheckItem = function(npc, player, clientId, subType) end

	local keywordHandler = KeywordHandler:new()
	local npcHandler = NpcHandler:new(keywordHandler)
	local hireling = nil
	local count = {} -- for banking
	local transfer = {} -- for banking

	npcType.onAppear = function(npc, creature)
		npcHandler:onAppear(npc, creature)

		if not hireling then
			local position = creature:getPosition()

			hireling = getHirelingByPosition(position)
			if not hireling then
				return
			end
			hireling:setCreature(creature)
		end
	end

	npcType.onDisappear = function(npc, creature)
		enableBankSystem[creature:getId()] = nil
		npcHandler:onDisappear(npc, creature)
	end

	npcType.onSay = function(npc, creature, type, message)
		npcHandler:onSay(npc, creature, type, message)
	end

	npcType.onCloseChannel = function(npc, creature)
		enableBankSystem[creature:getId()] = nil
		npcHandler:onCloseChannel(npc, creature)
	end

	npcType.onThink = function(npc, interval)
		npcHandler:onThink(npc, interval)
	end

	local TOPIC = {
		NONE = 1000,
		LAMP = 1001,
		SERVICES = 1100,
		BANK = 1200,
		FOOD = 1300,
		GOODS = 1400,
		IMBUEMENT_START = 2000,
		IMBUEMENT_BUY = 2001,
		IMBUEMENT_END = 2002,
	}

	local TOPIC_FOOD = {
		SKILL_CHOOSE = 1301,
	}

	local GREETINGS = {
		BANK = "Alright! What can I do for you and your bank business, |PLAYERNAME|?",
		FOOD = [[Hmm, yes! A variety of fine food awaits! However, a small expense of 15000 gold is expected to make these delicious masterpieces happen.
			For 90000 gold I will also serve you a specific dish. Just tell me what it shall be: a {specific} meal or a little {surprise}.]],
		STASH = "Of course, here is your stash! Well-maintained and neatly sorted for your convenience!",
	}

	local function getHirelingSkills()
		local skills = {}
		if hireling:hasSkill(HIRELING_SKILLS.BANKER[2]) then
			table.insert(skills, HIRELING_SKILLS.BANKER[1])
		end
		if hireling:hasSkill(HIRELING_SKILLS.COOKING[2]) then
			table.insert(skills, HIRELING_SKILLS.COOKING[1])
		end
		if hireling:hasSkill(HIRELING_SKILLS.STEWARD[2]) then
			table.insert(skills, HIRELING_SKILLS.STEWARD[1])
		end
		-- ignoring trader skills as it shows the same message about {goods}
		return skills
	end

	local function getHirelingServiceString(creature)
		local skills = getHirelingSkills()
		local str = "Do you want to see my {goods}"

		for i = 1, #skills do
			if i == #skills then
				str = str .. " or "
			else
				str = str .. ", "
			end

			if skills[i] == HIRELING_SKILLS.BANKER[1] then
				str = str .. "to access your {bank} account" -- TODO: this setence is not official
			elseif skills[i] == HIRELING_SKILLS.COOKING[1] then
				str = str .. "to order {food}"
			elseif skills[i] == HIRELING_SKILLS.STEWARD[1] then
				str = str .. "to open your {stash}"
			end
		end
		str = str .. "?"

		local player = Player(creature)

		if player:getGuid() == hireling:getOwnerId() then
			str = str .. " If you want, I can go back to my {lamp} or maybe change my {outfit}."
		end
		return str
	end

	local function sendSkillNotLearned(npc, creature, skillName)
		local message = "Sorry, but I do not have mastery in this skill yet."
		if skillName then
			message = string.format("I'm not a %s and would not know how to help you with that, sorry. I can start a %s apprenticeship if you buy it for me in the store!", skillName, skillName)
		end

		npcHandler:say(message, npc, creature)
	end
	-- ----------------------[[ END STEWARD FUNCTIONS ]] ------------------------------
	--[[
	############################################################################
	############################################################################
	############################################################################
	]]
	-- ========================[[ COOKER FUNCTIONS ]] ========================== --

	local function getDeliveredMessageByFoodId(food_id) -- remove the hardcoded food ids
		local message = ""
		if food_id == 29408 then
			message = "Oh yes, a tasty roasted wings to make you even tougher and skilled with the defensive arts."
		elseif food_id == 29409 then
			message = "Divine! Carrot is a well known nourishment that makes the eyes see even more sharply."
		elseif food_id == 29410 then
			message = "Magnifique! A tiger meat that has been marinated for several hours in magic spices."
		elseif food_id == 29411 then
			message = "Aaah, the beauty of the simple dishes! A delicate salad made of selected ingredients, capable of bring joy to the hearts of bravest warriors and their weapons."
		elseif food_id == 29412 then
			message = "Oh yes, very spicy chilly combined with delicious minced carniphila meat and a side dish of fine salad!"
		elseif food_id == 29413 then
			message = "Aaah, the northern cuisine! A catch of fresh salmon right from the coast Svargrond is the base of this extraordinary fish dish."
		elseif food_id == 29414 then
			message = "A traditional and classy meal. A beefy casserole which smells far better than it sounds!"
		elseif food_id == 29415 then
			message = "A tasty chunk of juicy beef with an aromatic sauce and parsley potatoes, mmh!"
		elseif food_id == 29416 then
			message = "Oooh, well... that one didn't quite turn out as it was supposed to be, I'm sorry."
		end

		return message
	end

	local function deliverFood(npc, creature, food_id, cost)
		local playerId = creature:getId()
		local player = Player(creature)
		local itType = ItemType(food_id)
		local inbox = player:getStoreInbox()
		local inboxItems = inbox:getItems()
		if player:getFreeCapacity() < itType:getWeight(1) then
			npcHandler:say("Sorry, but you don't have enough capacity.", npc, creature)
		elseif not inbox or #inboxItems >= inbox:getMaxCapacity() then
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			npcHandler:say("Sorry, you don't have enough room on your inbox.", npc, creature)
		elseif not player:removeMoneyBank(cost) then
			npcHandler:say("Sorry, you don't have enough money.", npc, creature)
		else
			local message = getDeliveredMessageByFoodId(food_id)
			npcHandler:say(message, npc, creature)
			inbox:addItem(food_id, 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
		end
		npcHandler:setTopic(playerId, TOPIC.SERVICES)
	end

	local function cookFood(npc, creature, specificRequest)
		local playerId = creature:getId()
		if specificRequest then
			npcHandler:say("Very well. You may choose one of the following: {chilli con carniphila}, {svargrond salmon filet}, {carrion casserole}, {consecrated beef}, {roasted wyvern wings}, {carrot pie}, {tropical marinated tiger}, or {delicatessen salad}.", npc, creature)
			npcHandler:setTopic(playerId, TOPIC_FOOD.SKILL_CHOOSE)
		else
			npcHandler:say("Alright, let me astonish you. Shall I?", npc, creature)
			deliverFood(npc, creature, HIRELING_FOODS_IDS[math.random(#HIRELING_FOODS_IDS)], 15000)
		end
	end

	local function handleFoodActions(npc, creature, message)
		local playerId = creature:getId()

		if npcHandler:getTopic(playerId) == TOPIC.FOOD then
			if MsgContains(message, "specific") then
				npcHandler:setTopic(playerId, TOPIC_FOOD.SPECIFIC)
				npcHandler:say("Which specific meal would you like? Choices are: {chilli con carniphila}, {svargrond salmon filet}, {carrion casserole}, {consecrated beef}, {roasted wyvern wings}, {carrot pie}, {tropical marinated tiger}, or {delicatessen salad}.", npc, creature)
			elseif MsgContains(message, "surprise") then
				local random = math.random(6)
				if random == 6 then
					npcHandler:setTopic(playerId, TOPIC_FOOD.SKILL_CHOOSE)
					npcHandler:say("Yay! I have the ingredients to make a skill boost dish. Would you rather like to boost your {magic}, {melee}, {shielding}, or {distance} skill?", npc, creature)
				else
					deliverFood(npc, creature, HIRELING_FOODS_IDS[random], 15000)
				end
			elseif MsgContains(message, "yes") then
				deliverFood(npc, creature, HIRELING_FOODS_IDS[math.random(#HIRELING_FOODS_IDS)], 15000)
			elseif MsgContains(message, "no") then
				npcHandler:setTopic(playerId, TOPIC.SERVICES)
				npcHandler:say("Alright then, ask me for other {services}, if you want.", npc, creature)
			end
		elseif npcHandler:getTopic(playerId) == TOPIC_FOOD.SKILL_CHOOSE then
			if MsgContains(message, "magic") then
				deliverFood(npc, creature, HIRELING_FOODS_BOOST.MAGIC, 15000)
			elseif MsgContains(message, "melee") then
				deliverFood(npc, creature, HIRELING_FOODS_BOOST.MELEE, 15000)
			elseif MsgContains(message, "shielding") then
				deliverFood(npc, creature, HIRELING_FOODS_BOOST.SHIELDING, 15000)
			elseif MsgContains(message, "distance") then
				deliverFood(npc, creature, HIRELING_FOODS_BOOST.DISTANCE, 15000)
			else
				npcHandler:say("Sorry, but you must choose a valid skill class. Would you like to boost your {magic}, {melee}, {shielding}, or {distance} skill?", npc, creature)
			end
		elseif npcHandler:getTopic(playerId) == TOPIC_FOOD.SPECIFIC then
			local specificFoodOptions = {
				["chilli con carniphila"] = 29412,
				["svargrond salmon filet"] = 29413,
				["carrion casserole"] = 29414,
				["consecrated beef"] = 29415,
				["roasted wyvern wings"] = 29408,
				["carrot pie"] = 29409,
				["tropical marinated tiger"] = 29410,
				["delicatessen salad"] = 29411,
			}

			if specificFoodOptions[message:lower()] then
				deliverFood(npc, creature, specificFoodOptions[message:lower()], 90000)
			else
				npcHandler:say("I'm sorry, but that's not a valid food option. Please choose from: {chilli con carniphila}, {svargrond salmon filet}, {carrion casserole}, {consecrated beef}, {roasted wyvern wings}, {carrot pie}, {tropical marinated tiger}, or {delicatessen salad}.", npc, creature)
			end
		end
	end

	-- ======================[[ END COOKER FUNCTIONS ]] ======================== --

	local function purchaseItems(npc, player, message)
		local packageData = imbuementPackagesData[message]
		if packageData and npcHandler:getTopic(player:getId()) == TOPIC.IMBUEMENT_START then
			npcHandler:say("Do you want to buy items for " .. packageData.text .. " imbuement for " .. packageData.moneyRequired .. " gold?", npc, player)
			npcHandler:setTopic(player:getId(), TOPIC.IMBUEMENT_BUY)
			playerImbuementData[player:getId()] = {
				moneyRequired = packageData.moneyRequired,
				itemList = packageData.itemList,
			}
		end
	end
	-- ======================[[ END IMBUEMENT FUNCTIONS ]] ======================== --

	local function creatureSayCallback(npc, creature, type, message)
		local player = Player(creature)
		local playerId = player:getId()

		if not npcHandler:checkInteraction(npc, creature) then
			return false
		end

		if not hireling:canTalkTo(player) then
			return false
		end

		-- imbuement packages
		local imbuementPackages =
			"These are the available imbuement packages, Skill increase: {bash}, {blockade}, {chop}, {epiphany}, {precision}, {slash}. Additional attributes: {featherweight}, {strike}, {swiftness}, {vampirism}, {vibrancy}, {void}. Elemental damage: {electrify}, {frost}, {reap}, {scorch}, {venom}. Elemental protection: {cloud fabric}, {demon presence}, {dragon hide}, {lich shroud}, {quara scale}, {snake skin}."
		if MsgContains(message, "imbuement packages") then
			npcHandler:setTopic(playerId, TOPIC.IMBUEMENT_START)
			npcHandler:say(imbuementPackages, npc, creature)
		elseif imbuementPackagesData[message] then
			purchaseItems(npc, player, message)
		elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == TOPIC.IMBUEMENT_BUY then
			local success, message = addItemsToShoppingBag(npc, player)
			if not success then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
				npcHandler:setTopic(playerId, TOPIC.IMBUEMENT_START)
				npcHandler:say(imbuementPackages, npc, player)
				return
			end

			npcHandler:say("You have successfully completed your purchase of the items.", npc, player)
			playerImbuementData[playerId] = nil
			npcHandler:setTopic(playerId, TOPIC.NONE)
			npcHandler:say(imbuementPackages, npc, creature)
		end

		-- roleplay
		if MsgContains(message, "sword of fury") then
			npcHandler:say("In my youth I dreamt to wield it! Now I wield the broom of... brooming. I guess that's the next best thing!", npc, creature)
		elseif MsgContains(message, "rookgaard") then
			npcHandler:say("What an uncivilised place without any culture.", npc, creature)
		elseif MsgContains(message, "excalibug") then
			-- end roleplay
			npcHandler:say("I'll keep an eye open for it when cleaning up the things you brought home!", npc, creature)
		elseif MsgContains(message, "service") then
			npcHandler:setTopic(playerId, TOPIC.SERVICES)
			local servicesMsg = getHirelingServiceString(creature)
			npcHandler:say(servicesMsg, npc, creature)
		elseif npcHandler:getTopic(playerId) == TOPIC.SERVICES then
			if MsgContains(message, "bank") then
				local bankerSkillName = HIRELING_SKILLS.BANKER[2]
				if hireling:hasSkill(bankerSkillName) then
					npcHandler:setTopic(playerId, TOPIC.BANK)
					count[playerId], transfer[playerId] = nil, nil
					npcHandler:say(GREETINGS.BANK, npc, creature)
				else
					sendSkillNotLearned(npc, creature, bankerSkillName)
				end
			elseif MsgContains(message, "food") then
				local bankerSkillName = HIRELING_SKILLS.COOKING[2]
				if hireling:hasSkill(bankerSkillName) then
					npcHandler:setTopic(playerId, TOPIC.FOOD)
					npcHandler:say(GREETINGS.FOOD, npc, creature)
				else
					sendSkillNotLearned(npc, creature, bankerSkillName)
				end
			elseif MsgContains(message, "stash") then
				local bankerSkillName = HIRELING_SKILLS.STEWARD[2]
				if hireling:hasSkill(bankerSkillName) then
					npcHandler:say(GREETINGS.STASH, npc, creature)
					player:setSpecialContainersAvailable(true)
					player:openStash(true)
					player:sendTextMessage(MESSAGE_FAILURE, "Your supply stash contains " .. player:getStashCount() .. " item" .. (player:getStashCount() > 1 and "s." or "."))
				else
					sendSkillNotLearned(npc, creature, bankerSkillName)
				end
			elseif MsgContains(message, "goods") then
				local string
				if not hireling:hasSkill(HIRELING_SKILLS.TRADER[2]) then
					string = "While I'm not a trader, I still have a collection of {various} items to sell if you like!"
				else
					string = "I sell a selection of {various} items, {exercise weapons}, {equipment}, " .. "{distance} weapons, {wands} and {rods}, {potions}, {runes}, " .. "{supplies}, {tools} and {postal} goods and {imbuement packages}. I can also {buy loot}. Just ask!"
				end
				npcHandler:setTopic(playerId, TOPIC.GOODS)
				npcHandler:say(string, npc, creature)
			elseif MsgContains(message, "lamp") then
				npcHandler:setTopic(playerId, TOPIC.LAMP)
				if player:getGuid() ~= hireling:getOwnerId() then
					return false
				end

				npcHandler:say("Are you sure you want me to go back to my lamp?", npc, creature)
			elseif MsgContains(message, "outfit") then
				if player:getGuid() ~= hireling:getOwnerId() then
					return false
				end

				hireling:requestOutfitChange()
				npcHandler:say("As you wish!", npc, creature)
			end
		elseif npcHandler:getTopic(playerId) == TOPIC.LAMP then
			if MsgContains(message, "yes") then
				hireling:returnToLamp(player:getGuid())
			else
				npcHandler:setTopic(playerId, TOPIC.SERVICES)
				npcHandler:say("Alright then, I will be here.", npc, creature)
			end
		elseif npcHandler:getTopic(playerId) == TOPIC.BANK then
			enableBankSystem[playerId] = true
		elseif npcHandler:getTopic(playerId) == TOPIC.FOOD or npcHandler:getTopic(playerId) == TOPIC_FOOD.SKILL_CHOOSE or npcHandler:getTopic(playerId) == TOPIC_FOOD.SPECIFIC then
			handleFoodActions(npc, creature, message)
		elseif npcHandler:getTopic(playerId) == TOPIC.GOODS then
			-- Ensures players cannot access other shop categories
			if not hireling:hasSkill(HIRELING_SKILLS.TRADER[2]) then
				if not MsgContains(message, "various") then
					local text = "While I'm not a trader, I still have a collection of {various} items to sell if you like!"
					npcHandler:say(text, npc, creature)
					return
				end

				npcHandler:say("Here are the items for the category various.", npc, creature)
				npc:openShopWindowTable(player, itemsTable["various"])
				return
			end

			local categoryTable = itemsTable[message:lower()]
			if categoryTable then
				npcHandler:say("Here are the items for the category " .. message .. ".", npc, creature)
				npc:openShopWindowTable(player, categoryTable)
			end
		end
		if enableBankSystem[playerId] then
			-- Parse bank
			npc:parseBank(message, npc, creature, npcHandler)
			-- Parse guild bank
			npc:parseGuildBank(message, npc, creature, playerId, npcHandler)
			-- Normal messages
			npc:parseBankMessages(message, npc, creature, npcHandler)
		end
		return true
	end

	npcHandler:setMessage(MESSAGE_GREET, "It is good to see you. I'm always at your {service}.")
	npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|, I'll be here if you need me again.")
	npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon!")

	npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
	npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

	-- npcType registering the npcConfig table
	npcType:register(npcConfig)
end

createHirelingType("Hireling")

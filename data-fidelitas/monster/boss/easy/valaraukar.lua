local mType = Game.createMonsterType("Valaraukar")
local monster = {}

monster.description = "a Valaraukar "
monster.experience = 28000
monster.outfit = {
	lookType = 300,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 465
monster.health = 35000
monster.maxHealth = 35000
monster.race = "undead"
monster.corpse = 8127
monster.speed = 260
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Death!", yell = false },
	{ text = "Come a little closer!", yell = false },
	{ text = "The end is near!", yell = false },
}

monster.loot = {
	{id = 3031, chance = 98000, maxCount = 184}, -- gold coin
	{id = 9058, chance = 75000, maxCount = 2}, -- gold ingot
	{id = 3422, chance = 2600, unique = true}, -- great shield
	{id = 8075, chance = 26000}, -- spellbook of lost souls
	{id = 3360, chance = 2400}, -- golden armor
	{id = 3364, chance = 2200}, -- golden legs
	{id = 8074, chance = 22000}, -- spellbook of mind control
	{id = 8040, chance = 22000}, -- velvet mantle
	{id = 3420, chance = 20000}, -- demon shield
	{id = 8057, chance = 20000}, -- divine plate
	{id = 821, chance = 20000}, -- magma legs
	{id = 3442, chance = 20000}, -- tempest shield
	{id = 3010, chance = 18000}, -- emerald bangle
	{id = 823, chance = 18000}, -- glacier kilt
	{id = 822, chance = 18000}, -- lightning legs
	{id = 3439, chance = 18000}, -- phoenix shield
	{id = 8090, chance = 18000}, -- spellbook of dark mysteries
	{id = 812, chance = 18000}, -- terra legs
	{id = 8102, chance = 16000}, -- emerald sword
	{id = 7405, chance = 16000}, -- havoc blade
	{id = 7451, chance = 16000}, -- shadow sceptre
	{id = 3032, chance = 16000, maxCount = 100}, -- small emerald
	{id = 3366, chance = 14000}, -- magic plate armor
	{id = 3414, chance = 14000}, -- mastermind shield
	{id = 7417, chance = 14000}, -- runed sword
	{id = 8076, chance = 14000}, -- spellscroll of prophecies
	{id = 7427, chance = 12000}, -- chaos mace
	{id = 8041, chance = 12000}, -- greenwood coat
	{id = 3029, chance = 12000, maxCount = 98}, -- small sapphire
	{id = 3026, chance = 12000, maxCount = 88}, -- white pearl
	{id = 7407, chance = 10000}, -- haunted blade
	{id = 3033, chance = 10000, maxCount = 54}, -- small amethyst
	{id = 9057, chance = 10000, maxCount = 87}, -- small topaz
	{id = 7382, chance = 8000}, -- demonrage sword
	{id = 3035, chance = 8000, maxCount = 58}, -- platinum coin
	{id = 5944, chance = 8000, maxCount = 9}, -- soul orb
	{id = 21186, chance = 8000}, -- mount
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -320 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -185, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -450, maxDamage = -820, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -400, length = 7, spread = 0, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -225, maxDamage = -275, radius = 4, effect = CONST_ME_MORTAREA, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 30,
	mitigation = 0.64,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 130, maxDamage = 205, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = 450, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 65 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)

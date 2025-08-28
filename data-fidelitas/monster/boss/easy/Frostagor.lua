local mType = Game.createMonsterType("Frostagor")
local monster = {}

monster.description = "a Frostagor"
monster.experience = 48000
monster.outfit = {
	lookType = 110,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 110

monster.health = 95000
monster.maxHealth = 95000
monster.race = "blood"
monster.corpse = 6038
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	isPreyExclusive = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Yooodelaaahooohooo", yell = false },
	{ text = "Yooodelaaaheehee", yell = false },
}

monster.loot = {
	{name = "blue robe", chance = 4600},
	{name = "lightning robe", chance = 8970},
	{name = "lightning boots", chance = 8880},
	{name = "winged boots", chance = 2002},
	{name = "lightning legs", chance = 3600},
	{name = "lightning headband", chance = 18000},
	{name = "sapphire hammer", chance = 13000},
	{name = "glacial rod", chance = 21500},
	{name = "crystalline armor", chance = 12500},
	{name = "bast legs", chance = 2600},
	{name = "exotic legs", chance = 2600},
	{name = "gill legs", chance = 2600},
	{id = 3549, chance = 3800},
	{name = "bear skin", chance = 2600},
	{name = "master archer's armor", chance = 2600},
	{name = "royal draken mail", chance = 2600},
	{name = "royal scale robe", chance = 2600},
	{name = "yalahari armor", chance = 2600},
	{name = "yalahari leg piece", chance = 2600},
	{name = "yalahari mask", chance = 2600},
}

monster.attacks = {
	{ name ="melee", interval = 1500, chance = 100, skill = 105, attack = 105},
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -180, range = 7, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = 0, maxDamage = -175, length = 3, spread = 0, effect = CONST_ME_POFF, target = false },
	{ name ="combat", interval = 900, chance = 21, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -750, length = 7, spread = 3, effect = CONST_ME_POFF},
	{ name ="speed", interval = 1000, chance = 11, speed = {min = -350, max = -550}, duration = 10000, length = 7, spread = 3, effect = CONST_ME_ICEATTACK},
	{ name ="combat", interval = 900, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -200, maxDamage = -680, radius = 4, target = true, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEAREA},
	{ name ="combat", interval = 800, chance = 22, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -560, radius = 3, target = false, effect = CONST_ME_ICETORNADO},
	{ name ="speed", interval = 1000, chance = 11, speed = {min = -500, max = -500}, duration = 10000, radius = 3, target = false, effect = CONST_ME_POFF},
	{ name ="combat", interval = 3000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -1100, radius = 8, target = false, effect = CONST_ME_GIANTICE}
}

monster.defenses = {
	defense = 33,
	armor = 28,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -8 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
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

local internalNpcName = "Julian"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 77,
	lookBody = 108,
	lookLegs = 86,
	lookFeet = 0,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- Promotion
local node1 = keywordHandler:addKeyword({ "promot", "promotion" }, StdModule.say, {
	npcHandler = npcHandler,
	onlyFocus = true,
	text = "I can promote you for 20000 gold coins. Do you want me to promote you?",
})
node1:addChildKeyword({ "yes" }, StdModule.promotePlayer, {
	npcHandler = npcHandler,
	cost = 20000,
	level = 20,
	text = "Congratulations! You are now promoted.",
})
node1:addChildKeyword({ "no" }, StdModule.say, {
	npcHandler = npcHandler,
	onlyFocus = true,
	text = "Alright then, come back when you are ready.",
	reset = true,
})

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. I can give you a {promotion}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)

local statues = {
    {
        statuePosition = Position(1103, 377, 7),
        requiredItem = 29292,
        itemCount = 1, 
        removeItem = false,
        teleportTo = Position(1229, 197, 7),
        effectOnUse = CONST_ME_TELEPORT,
        effectOnFail = CONST_ME_POFF
    },
    {
        statuePosition = Position(1103, 382, 7),
        requiredItem = 29294,
        itemCount = 1,
        removeItem = false,
        teleportTo = Position(1017, 327, 7),
        effectOnUse = CONST_ME_TELEPORT,
        effectOnFail = CONST_ME_POFF
    },
    {
        statuePosition = Position(1103, 387, 7),
        requiredItem = 29293,
        itemCount = 1,
        removeItem = false,
        teleportTo = Position(1354, 335, 7),
        effectOnUse = CONST_ME_TELEPORT,
        effectOnFail = CONST_ME_POFF
    },
    {
        statuePosition = Position(1103, 392, 7),
        requiredItem = 29291,
        itemCount = 1,
        removeItem = false,
        teleportTo = Position(1115, 386, 7),
        effectOnUse = CONST_ME_TELEPORT,
        effectOnFail = CONST_ME_POFF
    }
}

local statueAction = Action()

function statueAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    for _, config in ipairs(statues) do
        if toPosition == config.statuePosition then
            if player:getItemCount(config.requiredItem) >= config.itemCount then
                if config.removeItem then
                    player:removeItem(config.requiredItem, config.itemCount)
                end
                
                player:teleportTo(config.teleportTo)
                config.teleportTo:sendMagicEffect(config.effectOnUse)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você é portador do item " .. getItemName(config.requiredItem) .. " e possui acesso!")
            else
                player:getPosition():sendMagicEffect(config.effectOnFail)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa de " .. config.itemCount .. "x de um item especifico para usar essa estátua.")
            end
            return true
        end
    end
    return false
end

for _, config in ipairs(statues) do
    statueAction:position(config.statuePosition)
end
statueAction:register()
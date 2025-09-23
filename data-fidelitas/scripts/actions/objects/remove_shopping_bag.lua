local emptybps = Action()
local playerDelay = {}

function emptybps.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local playerId = player:getId()

    if playerDelay[playerId] then
        player:sendCancelMessage("Please wait before using this again.")
        return true
    end

    playerDelay[playerId] = true

    local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
    local removed = false

    if backpack and backpack:isContainer() then
        for _, itemZ in ipairs(backpack:getItems(true)) do
            if itemZ:getId() == ITEM_SHOPPING_BAG and itemZ:getEmptySlots() == 20 then
                itemZ:remove()
                removed = true
            end
        end
    end

    if removed then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cleaned your empty main shopping bags.")
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have no empty shopping bags in your main backpack.")
    end

    addEvent(function(pid)
        local p = Player(pid)
        if p then
            playerDelay[pid] = false
        end
    end, 2000, playerId)

    return true
end

emptybps:aid(26914)
emptybps:register()
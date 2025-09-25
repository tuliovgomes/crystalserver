local upgraderItem = 948

local tierUpgrade = Action()
function tierUpgrade.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local targetUpgradeItem = target and target:isItem() and Item(target.uid)
    if not targetUpgradeItem then
        player:say("You need to use this on another item.", TALKTYPE_MONSTER_SAY)
        return false
    end

    if item:getId() ~= upgraderItem then -- item ID
        player:say("You can't use this for a tier upgrade.", TALKTYPE_MONSTER_SAY)
        return false
    end

    local currentTier = targetUpgradeItem:getTier()
    local classification = targetUpgradeItem:getClassification()

    local maxTier = 0
    if classification == 1 then
        maxTier = 1
    elseif classification == 2 then
        maxTier = 2
    elseif classification == 3 then
        maxTier = 3
    elseif classification == 4 then
        maxTier = 10
    else
        player:say("Invalid item classification.", TALKTYPE_MONSTER_SAY)
        return false
    end

    if currentTier >= maxTier then
        player:say("This item has already reached its maximum tier.", TALKTYPE_MONSTER_SAY)
        return false
    end

    local requiredItems = currentTier + 1 -- ammount of itens needed to increase tier
    local playerItemCount = player:getItemCount(upgraderItem) -- item ID

    if playerItemCount < requiredItems then
        player:say("You need " .. requiredItems .. " items to upgrade to the next tier.", TALKTYPE_MONSTER_SAY)
        return false
    end

    if not targetUpgradeItem:setTier(currentTier + 1) then
        player:say("Failed to upgrade item tier. Please try again.", TALKTYPE_MONSTER_SAY)
        return false
    end

    player:removeItem(upgraderItem, requiredItems) -- Item ID
    player:say("Upgrade successful! Item is now Tier " .. (currentTier + 1) .. ".", TALKTYPE_MONSTER_SAY) 
    return true
end

tierUpgrade:id(upgraderItem) -- Item ID
tierUpgrade:register()
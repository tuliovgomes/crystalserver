local config = {
    leverPosition = Position(811, 832, 6),
    requiredItemId = 37317,
    leverIds = {
        inactive = 30410,
        active = 30411
    },
    positions = {
        {x = 807, y = 831, z = 6}, -- primeira posição
        {x = 808, y = 831, z = 6},
        {x = 809, y = 831, z = 6},
        {x = 810, y = 831, z = 6},
        {x = 811, y = 831, z = 6}, -- Centro
        {x = 812, y = 831, z = 6},
        {x = 813, y = 831, z = 6},
        {x = 814, y = 831, z = 6},
        {x = 815, y = 831, z = 6} -- Última posição
    },
    items = {
        {id = 37317, minCount = 1, maxCount = 2, chance = 1, raro = true},
        {id = 34109, minCount = 1, maxCount = 1, chance = 1, raro = true},
        {id = 39546, minCount = 1, maxCount = 1, chance = 1, raro = true},
        {id = 22118, minCount = 50, maxCount = 150, chance = 1, raro = true},
        {id = 36725, minCount = 1, maxCount = 1, chance = 1, raro = true},
        {id = 3043, minCount = 1, maxCount = 5, chance = 4},
        {id = 37110, minCount = 1, maxCount = 1, chance = 4},
        {id = 37335, minCount = 1, maxCount = 1, chance = 4},
        {id = 37337, minCount = 1, maxCount = 1, chance = 4},
        {id = 37338, minCount = 1, maxCount = 1, chance = 4},
        {id = 31633, minCount = 1, maxCount = 1, chance = 2},
        {id = 36729, minCount = 1, maxCount = 3, chance = 3},
        {id = 36730, minCount = 1, maxCount = 3, chance = 3},
        {id = 36731, minCount = 1, maxCount = 3, chance = 3},
        {id = 36732, minCount = 1, maxCount = 3, chance = 3},
        {id = 36733, minCount = 1, maxCount = 3, chance = 3},
        {id = 36734, minCount = 1, maxCount = 3, chance = 3},
        {id = 36735, minCount = 1, maxCount = 3, chance = 3},
        {id = 36736, minCount = 1, maxCount = 3, chance = 3},
        {id = 36737, minCount = 1, maxCount = 3, chance = 3},
        {id = 36738, minCount = 1, maxCount = 3, chance = 3},
        {id = 36739, minCount = 1, maxCount = 3, chance = 3},
        {id = 36740, minCount = 1, maxCount = 3, chance = 3},
        {id = 36741, minCount = 1, maxCount = 3, chance = 3},
        {id = 36742, minCount = 1, maxCount = 3, chance = 3},
    },
    ultraRareItems = {37317, 34109, 39546},
    ultraRareChatChannel = 15
}

local isRouletteRunning = false

local function revertLever(position)
    local leverItem = Tile(position):getItemById(config.leverIds.active)
    if leverItem then
        leverItem:transform(config.leverIds.inactive)
    end
end

local function getRandomCount(item)
    if item.minCount and item.maxCount then
        return math.random(item.minCount, item.maxCount)
    end
    return item.count or 1
end

-- Nova função para limpar apenas a última posição
local function clearLastPosition()
    local lastPos = config.positions[#config.positions]
    local tile = Tile(Position(lastPos))
    if tile then
        local item = tile:getTopDownItem()
        if item then
            item:remove()
        end
    end
end

local function addItemToPlayer(player, item)
    local count = getRandomCount(item)
    player:addItem(item.id, count)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens! Voce Ganhou " .. count .. "x " .. ItemType(item.id):getName() .. "!")
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
    
    if table.contains(config.ultraRareItems, item.id) then
        local message = player:getName() .. " ganhou um item ULTRA RARO: " .. count .. "x " .. ItemType(item.id):getName() .. " na roleta!"
        sendChannelMessage(config.ultraRareChatChannel, TALKTYPE_CHANNEL_Y, message)
        Game.broadcastMessage(message, MESSAGE_EVENT_ADVANCE)
    elseif item.raro then
        Game.broadcastMessage(player:getName() .. " ganhou um item raro: " .. count .. "x " .. ItemType(item.id):getName() .. " na roleta!", MESSAGE_EVENT_ADVANCE)
    end
end

local function getRandomItem()
    local totalWeight = 0
    for _, item in ipairs(config.items) do
        totalWeight = totalWeight + item.chance
    end
    
    local randomWeight = math.random() * totalWeight
    local cumulativeWeight = 0
    for _, item in ipairs(config.items) do
        cumulativeWeight = cumulativeWeight + item.chance
        if randomWeight <= cumulativeWeight then
            return item
        end
    end
end

local function moveItems()
    for i = #config.positions, 2, -1 do
        local tile = Tile(config.positions[i - 1])
        local item = tile and tile:getTopDownItem()
        if item then
            item:moveTo(config.positions[i])
        end
    end
end

local function clearItems()
    for _, pos in ipairs(config.positions) do
        local tile = Tile(Position(pos))
        if tile then
            local item = tile:getTopDownItem()
            while item do
                item:remove()
                item = tile:getTopDownItem()
            end
        end
    end
end

local function createItemWithEffect(position, item)
    local count = getRandomCount(item)
    Game.createItem(item.id, count, Position(position))
    Position(position):sendMagicEffect(CONST_ME_MAGIC_BLUE)
end

local function getItemConfigById(itemId)
    for _, item in ipairs(config.items) do
        if item.id == itemId then
            return item
        end
    end
    return nil
end

local function rouletteAction(player)
    isRouletteRunning = true
    clearItems()
    
    local steps = 9 + math.random(5, 8)
    local interval = 25
    
    local currentItem = getRandomItem()
    createItemWithEffect(config.positions[1], currentItem)
    
    for i = 1, steps do
        addEvent(function()
            moveItems()
            if i == steps then
                local winningItem = Tile(Position(config.positions[4])):getTopDownItem()
                if winningItem then
                    clearItems()
                    
                    -- Mostrar itens em todas as posições
                    for _, pos in ipairs(config.positions) do
                        createItemWithEffect(pos, {id = winningItem:getId(), minCount = winningItem:getCount(), maxCount = winningItem:getCount()})
                    end
                    
                    -- Entregar item e efeitos
                    local itemConfig = getItemConfigById(winningItem:getId())
                    if itemConfig then
                        addItemToPlayer(player, itemConfig)
                        
                        -- Fogos em todas as posições
                        for _, pos in ipairs(config.positions) do
                            Position(pos):sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
                        end
                        
                        -- Limpar apenas o último item após 1 segundos
                        addEvent(function()
                            clearItems()
                        end, 1000)
                    end
                end
                isRouletteRunning = false
            else
                local lastPositionTile = Tile(Position(config.positions[#config.positions]))
                if lastPositionTile then
                    local lastItem = lastPositionTile:getTopDownItem()
                    if lastItem then
                        lastItem:remove()
                        Position(config.positions[#config.positions]):sendMagicEffect(CONST_ME_POFF)
                    end
                end
                currentItem = getRandomItem()
                createItemWithEffect(config.positions[1], currentItem)
            end
        end, i * interval)
        
        interval = interval + 25
    end
end

local rouletteLever = Action()

function rouletteLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if isRouletteRunning then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Roleta funcionando. Por favor, espere.")
        return false
    end
    
    if fromPosition == config.leverPosition then
        if player:removeItem(config.requiredItemId, 1) then
            item:transform(config.leverIds.active)
            addEvent(revertLever, 5 * 1000, toPosition)
            rouletteAction(player)
            return true
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Precisa de um Tigrinho token para acionar a roleta.")
            return false
        end
    end
    return false
end

rouletteLever:position(config.leverPosition)
rouletteLever:register()

local questConfig = {
    {
        storage = 70001, 
        chestId = 1740,
        position = Position(903, 442, 4), 
        rewards = {
            {id = 3043, count = 10},
            {id = 3386, count = 1},
        }
    },
    {
        storage = 70002,
        chestId = 1740,
        position = Position(813, 718, 2),
        rewards = {
            {id = 3043, count = 5},
            {id = 8063, count = 1},
        }
    },
    {
        storage = 70003,
        chestId = 2027,
        position = Position(888, 679, 7),
        rewards = {
            {id = 3043, count = 5},
            {id = 3436, count = 1},
        }
    },
    {
        storage = 70004,
        chestId = 2031,
        position = Position(911, 609, 6),
        rewards = {
            {id = 3043, count = 5},
            {id = 3387, count = 1},
        }
    },
    {
        storage = 70005,
        chestId = 5915,
        position = Position(687, 842, 0),
        rewards = {
            {id = 3043, count = 5},
            {id = 3389, count = 1},
        }
    },
    {
        storage = 70006,
        chestId = 5915,
        position = Position(613, 774, 0),
        rewards = {
            {id = 3043, count = 15},
            {id = 22726, count = 1},
            {id = 6529, count = 1},
            {id = 6299, count = 1},
        }
    },
    {
        storage = 70007,
        chestId = 10033,
        position = Position(613, 774, 0),
        rewards = {
            {id = 3043, count = 15},
            {id = 22726, count = 1},
            {id = 10385, count = 1},
            {id = 3006, count = 1},
        }
    }

    
}

local questAction = Action()

function questAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    for _, quest in ipairs(questConfig) do
        if item:getId() == quest.chestId and toPosition == quest.position then
            -- Verifica storage
            if player:getStorageValue(quest.storage) > 0 then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você já pegou essa recompensa.")
                return true
            end

            -- Dá os itens
            for _, reward in ipairs(quest.rewards) do
                player:addItem(reward.id, reward.count)
            end

            -- Marca no storage
            player:setStorageValue(quest.storage, 1)

            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você recebeu sua recompensa!")
            return true
        end
    end

    return false
end

-- Registra a action para todos os baús/estátuas configurados
for _, quest in ipairs(questConfig) do
    questAction:id(quest.chestId)
end

questAction:register()
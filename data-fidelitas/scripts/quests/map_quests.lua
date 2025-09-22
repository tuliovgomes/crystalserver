local questConfig = {
    {
        storage = 70001,
        position = Position(903, 442, 4),
        rewards = {
            {id = 3043, count = 10},
            {id = 3386, count = 1},
        }
    },
    {
        storage = 70002,
        position = Position(813, 718, 2),
        rewards = {
            {id = 3043, count = 5},
            {id = 8063, count = 1},
        }
    },
    {
        storage = 70003,
        position = Position(888, 679, 7),
        rewards = {
            {id = 3043, count = 5},
            {id = 3436, count = 1},
        }
    },
    {
        storage = 70004,
        position = Position(911, 609, 6),
        rewards = {
            {id = 3043, count = 5},
            {id = 3387, count = 1},
        }
    },
    {
        storage = 70005,
        position = Position(687, 842, 0),
        rewards = {
            {id = 3043, count = 5},
            {id = 3389, count = 1},
        }
    },
    {
        storage = 70006,
        position = Position(612, 774, 0),
        rewards = {
            {id = 3043, count = 15},
            {id = 22726, count = 1},
            {id = 6529, count = 1},
            {id = 6299, count = 1},
        }
    },
    {
        storage = 70007,
        position = Position(1300, 785, 1),
        rewards = {
            {id = 3043, count = 15},
            {id = 22726, count = 1},
            {id = 10385, count = 1},
            {id = 3006, count = 1},
        }
    },
    {
        storage = 70008,
        position = Position(973, 846, 8),
        rewards = {
            {id = 3043, count = 10},
            {id = 3063, count = 1},
            {id = 36725, count = 1},
            {id = 8102, count = 1},
        }
    },
    {
        storage = 70009,
        position = Position(698, 783, 7),
        rewards = {
            {id = 3043, count = 10},
            {id = 3245, count = 1},
        }
    },
    {
        storage = 70010,
        position = Position(783, 494, 8),
        rewards = {
            {id = 3043, count = 10},
            {id = 6299, count = 1},
        }
    },
    {
        storage = 70011,
        position = Position(711, 538, 8),
        rewards = {
            {id = 3043, count = 1},
            {id = 816, count = 1},
        }
    },
    {
        storage = 70012,
        position = Position(615, 746, 8),
        rewards = {
            {id = 3309, count = 1},
            {id = 3319, count = 1},
            {id = 3288, count = 1},
            {id = 12057, count = 1},
        }
    },
    {
        storage = 70013,
        position = Position(890, 1066, 5),
        rewards = {
            {id = 349, count = 1},
        }
    },
    {
        storage = 70014,
        position = Position(686, 933, 7),
        rewards = {
            {id = 31617, count = 1},
            {id = 3387, count = 1},
            {id = 3420, count = 1},
            {id = 6566, count = 1},
        }
    }
}



local questAction = Action()

function questAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    for _, quest in ipairs(questConfig) do
        if toPosition == quest.position then
            if player:getStorageValue(quest.storage) > 0 then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você já pegou essa recompensa.")
                return true
            end

            for _, reward in ipairs(quest.rewards) do
                player:addItem(reward.id, reward.count)
            end

            player:setStorageValue(quest.storage, 1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você recebeu sua recompensa!")
            return true
        end
    end
    return false
end

-- Registra pelas posições dos baús
for _, quest in ipairs(questConfig) do
    questAction:position(quest.position)
end

questAction:register()

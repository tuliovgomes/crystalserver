local config = {
    duration = 15, -- tempo para reset, em minutos
    level_req = 150, -- nível mínimo para fazer a quest
    min_players = 0, -- número mínimo de players
    lever_id = 2772, -- id da alavanca antes de puxar
    storage_quest = 50002 -- storage para controle da quest
}

local player_positions = {
    [1] = {fromPos = Position(730, 552, 7), toPos = Position(783, 500, 8)},
    [2] = {fromPos = Position(731, 552, 7), toPos = Position(783, 500, 8)},
    [3] = {fromPos = Position(732, 552, 7), toPos = Position(783, 500, 8)},
    [4] = {fromPos = Position(733, 552, 7), toPos = Position(783, 500, 8)}
}

local monsters = {
    [1] = {pos = Position(782, 507, 8), name = "Frostagor"},
}

function doResetFornim(uid)
    local item = Item(uid)
    if not item then
        return
    end

    local monster_names = {}
    for _, value in pairs(monsters) do
        if not isInArray(monster_names, value.name) then
            monster_names[#monster_names + 1] = value.name
        end
    end

    for i = 1, #monsters do
        local creatures = Tile(monsters[i].pos):getCreatures()
        for _, creature in pairs(creatures) do
            if isInArray(monster_names, creature:getName()) then
                creature:remove()
            end
        end
    end

    for i = 1, #player_positions do
        local creatures = Tile(player_positions[i].toPos):getCreatures()
        for _, creature in pairs(creatures) do
            if isInArray(monster_names, creature:getName()) then
                creature:remove()
            end
        end
    end

    item:transform(config.lever_id)
end

local Fornim = Action()

function Fornim.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item.itemid ~= config.lever_id then
        return player:sendCancelMessage("A quest está em andamento. Aguarde " .. config.duration .. " minutos.")
    end

    local participants, pull_player = {}, false
    for i = 1, #player_positions do
        local fromPos = player_positions[i].fromPos
        local tile = Tile(fromPos)
        if not tile then
            print(">> ERROR: Tile não existe em Position(" .. fromPos.x .. ", " .. fromPos.y .. ", " .. fromPos.z .. ").")
            return player:sendCancelMessage("Erro na quest, chame um administrador.")
        end

        local creature = tile:getBottomCreature()
        if creature then
            local participant = creature:getPlayer()
            if not participant then
                return player:sendCancelMessage("Todos os participantes devem ser jogadores.")
            end

            if participant:getLevel() < config.level_req then
                return player:sendCancelMessage(participant:getName() .. " não tem o nível necessário.")
            end

            -- 🔹 Verificação da Storage
            if participant:getStorageValue(config.storage_quest) == 1 then
                return player:sendCancelMessage(participant:getName() .. " já completou essa quest e não pode entrar novamente.")
            end

            if participant.uid == player.uid then
                pull_player = true
            end

            participants[#participants + 1] = {participant = participant, toPos = player_positions[i].toPos}
        end
    end

    if #participants < config.min_players then
        return player:sendCancelMessage("Número insuficiente de participantes.")
    end

    if not pull_player then
        return player:sendCancelMessage("Você não está na posição correta.")
    end

    for i = 1, #monsters do
        local toPos = monsters[i].pos
        if not Tile(toPos) then
            print(">> ERROR: Tile não existe em Position(" .. toPos.x .. ", " .. toPos.y .. ", " .. toPos.z .. ").")
            return player:sendCancelMessage("Erro na quest, chame um administrador.")
        end
        Game.createMonster(monsters[i].name, monsters[i].pos, false, true)
    end

    -- 🔹 Teleporta players e seta storage
    for i = 1, #participants do
        local p = participants[i].participant
        p:teleportTo(participants[i].toPos)
        participants[i].toPos:sendMagicEffect(CONST_ME_TELEPORT)
        p:setStorageValue(config.storage_quest, 1) -- Marca que já fez a quest
    end

    addEvent(doResetFornim, config.duration * 60 * 1000, item.uid)
    return true
end

Fornim:aid(55616)
Fornim:register()
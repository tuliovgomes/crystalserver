-- Developer = "Túlio Gomes"
-- Version = "2.1"
-- lastUpdate = "20/08/2025"

local config = {
    actionId = 1945,
    price = 5000,     -- custo para jogar
    reward = 50000,   -- recompensa
    cooldown = 6,     -- segundos entre apostas
    storageInfo = 82193, -- storage para mostrar regras 1x ao dia
    storageCooldown = 82192, -- storage global anti-spam
    monsters = {"Death Blob", "Acid Blob", "Ink Blob"},
    positions = {
        Position(810, 833, 5),
        Position(811, 833, 5),
        Position(812, 833, 5)
    }
}

local slotMachine = Action()

function slotMachine.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local monsters = config.monsters
    local pos = config.positions

    -- Mostra regras ao jogador uma vez por dia
    if player:kv():get(config.storageInfo) == nil or player:kv():get(config.storageInfo) < os.time() then
        local str = "Rules for betting on the slot machine:\n\n"
        str = str .. "To bet on this machine the price is: " .. config.price .. " gold.\n"
        str = str .. "The reward in this machine is: " .. config.reward .. " gold."
        player:popupFYI(str)
        player:kv():set(config.storageInfo, os.time() + 24*60*60)
        return true
    end

    -- Anti-spam (global)
    if Game.getStorageValue(config.storageCooldown) and Game.getStorageValue(config.storageCooldown) > os.time() then
        player:sendCancelMessage("You need to wait a second to bet.")
        return true
    end

    if not player:removeMoney(config.price) then
        player:sendCancelMessage("You don't have enough money. You need " .. config.price .. " to bet.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    Game.setStorageValue(config.storageCooldown, os.time() + config.cooldown)

    -- efeitos iniciais
    for _, p in ipairs(pos) do
        p:sendMagicEffect(CONST_ME_BLOCKHIT)
        p:sendMagicEffect(CONST_ME_FIREAREA)
        p:sendMagicEffect(CONST_ME_MAGIC_GREEN)
    end

    local rolls = {math.random(1, #monsters), math.random(1, #monsters), math.random(1, #monsters)}
    local spawned = {}

    -- cria primeiro monstro
    addEvent(function()
        local m1 = Game.createMonster(monsters[rolls[1]], pos[1], false, true)
        if m1 then
            m1:changeSpeed(0)
            pos[1]:sendMagicEffect(CONST_ME_FIREAREA)
            pos[1]:sendMagicEffect(CONST_ME_MAGIC_GREEN)
            table.insert(spawned, m1)
        end
    end, 1000)

    -- cria segundo monstro
    addEvent(function()
        local m2 = Game.createMonster(monsters[rolls[2]], pos[2], false, true)
        if m2 then
            m2:changeSpeed(0)
            pos[2]:sendMagicEffect(CONST_ME_FIREAREA)
            pos[2]:sendMagicEffect(CONST_ME_MAGIC_GREEN)
            table.insert(spawned, m2)
        end
    end, 2000)

    -- cria terceiro monstro
    addEvent(function()
        local m3 = Game.createMonster(monsters[rolls[3]], pos[3], false, true)
        if m3 then
            m3:changeSpeed(0)
            pos[3]:sendMagicEffect(CONST_ME_FIREAREA)
            pos[3]:sendMagicEffect(CONST_ME_MAGIC_GREEN)
            table.insert(spawned, m3)
        end
    end, 3000)

    -- checa resultado
    addEvent(function()
        for _, p in ipairs(pos) do
            p:sendMagicEffect(CONST_ME_SOUND_BLUE)
            p:sendMagicEffect(CONST_ME_FIREAREA)
            p:sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end

        -- remove monstros criados
        for _, m in ipairs(spawned) do
            if m and m:isMonster() then
                m:remove()
            end
        end

        -- verifica se ganhou
        if rolls[1] == rolls[2] and rolls[1] == rolls[3] then
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
            player:say("You Win :)", TALKTYPE_MONSTER_SAY)
            player:addMoney(config.reward)
        else
            player:say("You Lose :(", TALKTYPE_MONSTER_SAY)
        end
    end, 4000)

    return true
end

slotMachine:aid(config.actionId)
slotMachine:register()

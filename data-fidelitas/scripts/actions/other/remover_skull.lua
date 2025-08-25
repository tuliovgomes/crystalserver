-- Remover Skull (Black, Red, White) - RevScript + Canary
-- Itens usados:
-- 37335 -> Remove Black Skull
-- 37338 -> Remove Red Skull
-- 37337 -> Remove White Skull
-- Coloque este arquivo em: data/scripts/actions/remover_skulls.lua
-- Requer que os itens estejam com usable="1" no items.xml


local skullRemover = Action()


local skullConfig = {
[37335] = { skull = SKULL_BLACK, name = "Black Skull" },
[37338] = { skull = SKULL_RED, name = "Red Skull" },
[37337] = { skull = SKULL_WHITE, name = "White Skull" }
}


function skullRemover.onUse(player, item, fromPosition, target, toPosition, isHotkey)
local config = skullConfig[item:getId()]
if not config then
return true
end


-- Verifica se o jogador está com a skull correspondente
if player:getSkull() ~= config.skull then
player:sendTextMessage(MESSAGE_FAILURE, "Você não está com " .. config.name .. ".")
return true
end


-- Remove a skull e o tempo restante
player:setSkull(SKULL_NONE)
player:setSkullTime(0)


-- Feedback visual e consumo do item
player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.name .. " removida com sucesso.")
item:remove(1)


return true
end


-- Registra os itens de uso
skullRemover:id(37335)
skullRemover:id(37338)
skullRemover:id(37337)
skullRemover:register()
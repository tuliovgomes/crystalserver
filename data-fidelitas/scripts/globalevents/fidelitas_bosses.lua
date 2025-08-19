local bossConfig = {
    {name = "Ferumbras", position = Position(687, 846, 0)},
    {name = "The Necromancer", position = Position(613, 780, 0)},
    {name = "Jaul", position = Position(627, 539, 14)},
    {name = "Obujus", position = Position(782, 594, 14)},
}

local spawnRandomBoss = GlobalEvent("spawnRandomBoss")

function spawnRandomBoss.onThink()
  local availableBosses = {}

  for _, config in ipairs(bossConfig) do
    local spectators = Game.getSpectators(config.position, false, false, 20, 20, 20, 20)
    local bossExists = false

    for i = 1, #spectators do
      local creature = spectators[i]
      if creature:isMonster() and not creature:getMaster() and creature:getName():lower() == config.name:lower() then
        bossExists = true
        break
      end
    end

    if not bossExists then
      table.insert(availableBosses, config)
    end
  end

  if #availableBosses == 0 then
    print("[BossSpawner] Todos os bosses já estão vivos. Nenhum novo foi spawnado.")
    return true
  end

  local selectedConfig = availableBosses[math.random(#availableBosses)]
  local monster = Game.createMonster(selectedConfig.name, selectedConfig.position)

  if monster then
    selectedConfig.position:sendMagicEffect(CONST_ME_TELEPORT)
    Game.broadcastMessage("O boss " .. selectedConfig.name .. " apareceu!", MESSAGE_STATUS_WARNING)
  end

  return true
end

spawnRandomBoss:interval(15 * 60 * 1000) -- 15 minutos
spawnRandomBoss:register()
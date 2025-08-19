local bossConfig = {
    {name = "Ferumbras", position =  Position(686, 846, 0)},
    {name = "The Necromancer", position = Position(613, 780, 0)},
}


local spawnRandomBoss = GlobalEvent("spawnRandomBoss")

-- Função auxiliar: verifica se o boss já está em qualquer lugar do mapa
local function isBossAlive(bossName)
  for _, monster in pairs(Game.getMonsters()) do
    if monster:getName():lower() == bossName:lower() then
      return true
    end
  end
  return false
end

function spawnRandomBoss.onThink()
  local availableBosses = {}

  -- Filtra os bosses que não estão vivos
  for _, config in ipairs(bossConfig) do
    if not isBossAlive(config.name) then
      table.insert(availableBosses, config)
    end
  end

  -- Nenhum boss disponível
  if #availableBosses == 0 then
    print("[BossSpawner] Todos os bosses já estão vivos. Nenhum novo foi spawnado.")
    return true
  end

  -- Escolhe e spawna um boss aleatório disponível
  local selected = availableBosses[math.random(#availableBosses)]
  local monster = Game.createMonster(selected.name, selected.position)

  if monster then
    selected.position:sendMagicEffect(CONST_ME_TELEPORT)
    Game.broadcastMessage("O boss " .. selected.name .. " apareceu!", MESSAGE_STATUS_WARNING)
  end

  return true
end

spawnRandomBoss:interval(15 * 60 * 1000) -- 15 minutos
spawnRandomBoss:register()
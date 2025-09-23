local bossConfig = {

  -- falcon island
  {name = "Grand Chaplain Gaunder", position = Position(514, 811, 6)},
  {name = "Grand Canon Dominus", position = Position(493, 806, 6)},
  {name = "Grand Commander Soeren", position = Position(513, 809, 5)},
  {name = "Preceptor Lazare", position = Position(489, 809, 7)},

  -- cobra island
  {name = "Gaffir", position = Position(936, 998, 6)},
  {name = "Custodian", position = Position(936, 999, 5)},
  {name = "Guard Captain Quaid", position = Position(948, 1000, 7)},

  -- desert cave
  {name = "Vashresamun", position = Position(920, 814, 5)},
  {name = "Dipthrah", position = Position(920, 814, 5)},
  {name = "Omruc", position = Position(920, 814, 5)},
  {name = "The Ravager", position = Position(918, 811, 6)},
  {name = "Mahrdis", position = Position(918, 811, 6)},
  {name = "Ashmunrah", position = Position(922, 814, 7)},
  {name = "Morguthis", position = Position(922, 814, 7)},

  -- priestess island
  {name = "Mozradek", position = Position(964, 658, 8)},
  {name = "Neferi The Spy", position = Position(968, 662, 8)},
  {name = "Sister Hetai", position = Position(987, 674, 8)},
  {name = "Amenef the Burning", position = Position(958, 675, 8)},

  -- Flimsy
  {name = "Irgix the Flimsy", position = Position(901, 1463, 7)},
  {name = "Unaz the Mean", position = Position(883, 1468, 7)},
  {name = "Vok The Freakish", position = Position(866, 1466, 7)}

  -- lion
  {name = "Yirkas Blue Scales", position = Position(892, 778, 9)},
  {name = "Srezz Yellow Eyes", position = Position(901, 765, 9)},
  {name = "Utua Stone Sting", position = Position(909, 778, 9)},
  {name = "Katex Blood Tongue", position = Position(901, 791, 9)},

  -- gnomes
  {name = "Deathstrike", position = Position(819, 1327, 8)},
  {name = "Gnomevil", position = Position(780, 1321, 8)},
  {name = "Abyssador", position = Position(818, 1300, 8)}

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
    print("[BossSpawner] Todos os Mini bosses já estão vivos. Nenhum novo foi spawnado.")
    return true
  end

  local selectedConfig = availableBosses[math.random(#availableBosses)]
  local monster = Game.createMonster(selectedConfig.name, selectedConfig.position)

  if monster then
    selectedConfig.position:sendMagicEffect(CONST_ME_TELEPORT)
    Game.broadcastMessage("O mini boss " .. selectedConfig.name .. " apareceu!", MESSAGE_STATUS_WARNING)
  end

  return true
end

spawnRandomBoss:interval(15 * 60 * 1000) -- 15 minutos
spawnRandomBoss:register()
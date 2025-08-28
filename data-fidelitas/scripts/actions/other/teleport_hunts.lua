local config = {
	{ name="Minotauros", position = Position(733, 760, 7), level = 8 },
	{ name="Amazon", position = Position(701, 738, 7), level = 8 },
	{ name="Kongs", position = Position(672, 662, 7), level = 8 },
	{ name="Orcs", position = Position(1201, 586, 7), level = 8 },
	{ name="Barbaros", position = Position(771, 594, 7), level = 10 },
	{ name="Cyclops", position = Position(627, 808, 7), level = 20 },
	{ name="Dragon Hatchling", position = Position(686, 607, 7), level = 30 },
	{ name="Precht", position = Position(877, 424, 7), level = 30 },
	{ name="Ice Witch", position = Position(786, 474, 7), level = 30 },
	{ name="Crystal Spiders", position = Position(760, 482, 7), level = 30 },
	{ name="Hero", position = Position(836, 711, 7), level = 50 },
	{ name="Giant Spider", position = Position(836, 711, 7), level = 50 },
	{ name="Hydras", position = Position(834, 667, 7), level = 50 },
	{ name="Vampires", position = Position(637, 702, 6), level = 50 },
	{ name="Pirats Rats", position = Position(837, 669, 7), level = 50 },
	{ name="Black Knight", position = Position(1051, 584, 6), level = 80 },
	{ name="Dragons", position = Position(1037, 522, 7), level = 80 },
	{ name="Frost Dragons", position = Position(846, 470, 7), level = 80 },
	{ name="Warlok", position = Position(662, 839, 6), level = 100 },
	{ name="Behemoth", position = Position(890, 910, 0), level = 100 },
	{ name="Lizards", position = Position(1258, 667, 7), level = 100 },
	{ name="Glooths", position = Position(1126, 700, 7), level = 100 },
	{ name="Wyrm", position = Position(570, 872, 7), level = 150 },
	{ name="Usurper", position = Position(673, 574, 7), level = 150 },
	{ name="Asuras", position = Position(985, 580, 7), level = 150 },
	{ name="Exotic Spiders", position = Position(860, 706, 8), level = 150 },
	{ name="Grim Reapers", position = Position(893, 841, 7), level = 150 },
	{ name="Hellhounds", position = Position(1119, 625, 7), level = 150 },
	{ name="Ice Demon", position = Position(950, 431, 7), level = 150 },
	{ name="Serpent Spawn", position = Position(1157, 593, 8), level = 150 },
	{ name="Fury", position = Position(491, 678, 7), level = 200 },
	{ name="Demon Catacombs", position = Position(575, 706, 7), level = 200 },
	{ name="Goannas", position = Position(827, 899, 6), level = 200 },
	{ name="Specters", position = Position(797, 840, 7), level = 200 },
	{ name="Medusa", position = Position(1174, 533, 9), level = 200 },
	{ name="True Asura", position = Position(1009, 560, 8), level = 200 },
	{ name="Crezed Winter", position = Position(821, 599, 7), level = 200 },
	{ name="Crazed Vangard 1", position = Position(625, 648, 7), level = 250 },
	{ name="Crazed Vangard 2", position = Position(540, 550, 7), level = 250 },
	{ name="Burning Gladiator", position = Position(975, 648, 7), level = 250 },
	{ name="Carnivros", position = Position(954, 733, 7), level = 250 },
	{ name="Dark Thais", position = Position(534, 717, 7), level = 300 },
	{ name="Infernal", position = Position(424, 690, 7), level = 300 },
	{ name="Fire Catacombs", position = Position(560, 679, 7), level = 300 },
	{ name="Cobras", position = Position(903, 933, 7), level = 300 },
	{ name="Guzzlemaw", position = Position(1366, 597, 6), level = 300 },
	{ name="Prision", position = Position(1419, 550, 8), level = 300 },
	{ name="Feversleep", position = Position(1517, 468, 7), level = 300 },
	{ name="Terrorsleep", position = Position(1494, 393, 7), level = 300 },
	{ name="Deeplings", position = Position(684, 530, 7), level = 300 },
	{ name="Falcon", position = Position(569, 850, 7), level = 300 },
	{ name="Bulltaurs", position = Position(583, 460, 7), level = 400 },
	{ name="Primal", position = Position(589, 949, 7), level = 500 },
	{ name="Livraria", position = Position(1102, 384, 7), level = 500 },
	{ name="Azzilon Castle", position = Position(573, 471, 6), level = 600 },
	{ name="Darklight", position = Position(415, 707, 7), level = 800 },
}

-- Função para exibir hunts por faixa de level
local function showHuntsByRange(player, minLevel, maxLevel)
    local window = ModalWindow {
        title = "Hunts",
        message = "Selecione uma hunt:"
    }

    for _, info in pairs(config) do
        if info.level >= minLevel and (maxLevel == -1 or info.level <= maxLevel) then
            window:addChoice(info.name ..' - '.. info.level, function(player, button, choice)
                if button.name ~= "Select" then
                    return true
                end
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
                player:teleportTo(info.position)
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                return true
            end)
        end
    end

    window:addButton("Select")
    window:addButton("Close")
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(player)
end

-- Primeira janela: seleção de faixa de level
local teleportCube = Action()
function teleportCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local window = ModalWindow {
        title = "Level Range",
        message = "Selecione a faixa de level:"
    }

    window:addChoice("8 - 50", function(player, button, choice)
        if button.name ~= "Select" then return true end
        showHuntsByRange(player, 8, 50)
        return true
    end)

    window:addChoice("50 - 150", function(player, button, choice)
        if button.name ~= "Select" then return true end
        showHuntsByRange(player, 50, 150)
        return true
    end)

    window:addChoice("150 - 300", function(player, button, choice)
        if button.name ~= "Select" then return true end
        showHuntsByRange(player, 150, 300)
        return true
    end)

    window:addChoice("300+", function(player, button, choice)
        if button.name ~= "Select" then return true end
        showHuntsByRange(player, 300, -1)
        return true
    end)

    window:addButton("Select")
    window:addButton("Close")
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(player)
    return true
end

teleportCube:id(31633)
teleportCube:register()
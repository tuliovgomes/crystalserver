local config = {
	{ name="fidelitas", position = Position(759, 729, 7) },
	{ name="Hunts", position = Position(1006, 996, 6) },
	{ name="Bosses", position = Position(1088, 986, 5) },
	{ name="Forja", position = Position(547, 650, 7) },
	{ name="NPCS", position = Position(743, 647, 7) },
	{ name="Tubal", position = Position(811, 833, 7) },
	{ name="Fornim", position = Position(768, 501, 7) },
	{ name="Nambastion", position = Position(980, 634, 7) },
	{ name="City Tp", position = Position(751, 695, 7) },
}

local teleportBasic = Action()
function teleportBasic.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local window = ModalWindow {
		title = "Teleport Modal",
		message = "Locations"
	}
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function (player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
			player:teleportTo(info.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end
teleportBasic:id(16262)
teleportBasic:register()

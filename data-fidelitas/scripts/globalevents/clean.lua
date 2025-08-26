local minutes = 15
local autoClean = GlobalEvent("autoclean")
function autoClean.onThink(interval, lastExecution)
    Game.broadcastMessage("Cleaning the map in 30 seconds. Please, take your items from the ground or it will be removed.", MESSAGE_GAME_HIGHLIGHT)
        addEvent(
            cleanMap,
            30000
        )
    return true
end
autoClean:interval(minutes * 60 * 1000) 
autoClean:register()
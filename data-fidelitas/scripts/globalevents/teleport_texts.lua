local effects = {
    {position = Position(751, 693, 7), text = 'Fidelitas', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(754, 693, 7), text = 'Tubal', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(757, 693, 7), text = 'Fornim', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(760, 693, 7), text = 'Nambastion', effect = CONST_ME_GROUNDSHAKER},    
    {position = Position(762, 723, 7), text = 'Citys', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(805, 837, 7), text = 'Citys', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(970, 639, 7), text = 'Citys', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(767, 502, 7), text = 'Citys', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(763, 723, 7), text = 'Npcs', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(764, 723, 7), text = 'Hunts', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(765, 723, 7), text = 'Bosses', effect = CONST_ME_GROUNDSHAKER},
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4550)
animatedText:register()
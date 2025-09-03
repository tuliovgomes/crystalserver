local config = {
    damageDay = {
        min = 2.55,
        max = 3
    },
    damageNight = {
        min = 1.50,
        max = 1.75
    },
    hourStartDay = 6,
    hourEndDay = 18
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function onGetFormulaValues(player, level, maglevel)
    local min, max = ((level / 5) + (maglevel * 6)), ((level / 4) + (maglevel * 8))
    local hour = tonumber(os.date("%H", os.time())) -- Obtém a hora atual

    -- Define o valor do dano com base na hora do dia
    if hour >= config.hourStartDay and hour < config.hourEndDay then -- Dia
        min = min * config.damageDay.min
        max = max * config.damageDay.max
    else -- Noite
        min = min * config.damageNight.min
        max = max * config.damageNight.max
    end

    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
    return combat:execute(creature, var)
end

rune:group("attack")
rune:name("Fire Missile rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_GREAT_FIREBALL_RUNE)
rune:runeId(3193)
rune:allowFarUse(true)
rune:charges(3)
rune:level(300)
rune:magicLevel(28)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:needTarget(true)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()
local area = createCombatArea({
	{ 1, 1, 1 },
	{ 1, 3, 1 },
	{ 1, 1, 1 },
})

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
combat:setParameter(COMBAT_PARAM_IMPACTSOUND, SOUND_EFFECT_TYPE_INFERNAL_BOLT_EFFECT)
combat:setParameter(COMBAT_PARAM_CASTSOUND, SOUND_EFFECT_TYPE_DIST_ATK_CROSSBOW)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
function onGetFormulaValues(player, skill, attack, factor)
	local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
	local min = (player:getLevel() / 4)
	local max = (0.09 * factor) * distanceSkill * attack + (player:getLevel() / 4)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat:setArea(area)

local infernalBolt = Weapon(WEAPON_AMMO)

function infernalBolt.onUseWeapon(player, variant)
	return combat:execute(player, variant)
end

infernalBolt:id(6528)
infernalBolt:level(500)
infernalBolt:attack(67)
infernalBolt:action("removecount")
infernalBolt:ammoType("bolt")
infernalBolt:shootType(CONST_ANI_INFERNALBOLT)
infernalBolt:maxHitChance(100)
infernalBolt:register()
local area = createCombatArea({
	{ 0, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1 },
	{ 1, 1, 3, 1, 1 },
	{ 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 0 },
})

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CRYSTALLINEARROW)
combat:setParameter(COMBAT_PARAM_IMPACTSOUND, SOUND_EFFECT_TYPE_DIAMOND_ARROW_EFFECT)
combat:setParameter(COMBAT_PARAM_CASTSOUND, SOUND_EFFECT_TYPE_DIST_ATK_BOW)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
function onGetFormulaValues(player, skill, attack, factor)
	local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
	local min = (player:getLevel() / 5)
	local max = (0.09 * factor) * distanceSkill * attack + (player:getLevel() / 5)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat:setArea(area)

local crystallineArrow = Weapon(WEAPON_AMMO)

function crystallineArrow.onUseWeapon(player, variant)
	return combat:execute(player, variant)
end

crystallineArrow:id(15793)
crystallineArrow:level(150)
crystallineArrow:attack(37)
crystallineArrow:action("removecount")
crystallineArrow:ammoType("arrow")
crystallineArrow:shootType(CONST_ANI_CRYSTALLINEARROW)
crystallineArrow:maxHitChance(100)
crystallineArrow:wieldUnproperly(true)
crystallineArrow:register()
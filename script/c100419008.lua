--忍の六武
--The Six Shinobi
--Scripted by Eerie Code
function c100419008.initial_effect(c)
	--activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCondition(c100419008.condition)
	e1:SetTarget(c100419008.target)
	e1:SetOperation(c100419008.activate)
	c:RegisterEffect(e1)
end
function c100419008.filter(c)
	return c:IsFaceup() and c:IsSetCard(0x3d)
end
function c100419008.condition(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(c100419008.filter,tp,LOCATION_MZONE,0,nil)
	return g:GetClassCount(Card.GetAttribute)==6
end
function c100419008.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return not Duel.IsPlayerAffectedByEffect(1-tp,EFFECT_SKIP_TURN) end
end
function c100419008.activate(e,tp,eg,ep,ev,re,r,rp)
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCode(EFFECT_SKIP_TURN)
	e1:SetTargetRange(0,1)
	e1:SetReset(RESET_PHASE+PHASE_END+RESET_OPPO_TURN)
	Duel.RegisterEffect(e1,tp)
end

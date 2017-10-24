--3014
function c3014.initial_effect(c)
 ---Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetOperation(c3014.activate)
	c:RegisterEffect(e1)
	-- local e1=Effect.CreateEffect(c)
	-- e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	-- e1:SetDescription(58074572,1)
	-- e1:SetType(EFFECT_TYPE_ACTIVATE)
	-- e1:SetCode(EVENT_FREE_CHAIN)
	-- e1:SetOperation(c3014.activate)
	-- c:RegisterEffect(e1)
	-- local e7=Effect.CreateEffect(c)
	-- e7:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_IGNORE_IMMUNE+EFFECT_FLAG_SET_AVAILABLE)
	-- e7:SetType(EFFECT_TYPE_FIELD)
	-- e7:SetCode(EFFECT_BECOME_QUICK)
	-- e7:SetRange(0xff)
	-- e7:SetTargetRange(0xff,0xff)
	-- e7:SetTarget(aux.TargetBoolFunction(Card.IsType,TYPE_SPELL))
	-- e7:SetCondition(function(e)return Duel.GetCurrentPhase()>=0x08 and Duel.GetCurrentPhase()<=0x80 and Duel.GetTurnPlayer()~=e:GetHandler():GetControler() end)
	-- c:RegisterEffect(e7)
	-- local e1=Effect.CreateEffect(c)
	-- e1:SetType(EFFECT_TYPE_FIELD)
	-- e1:SetCode(EFFECT_SPSUMMON_PROC_G)
	-- e1:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE)
	-- e1:SetRange(0xff)
	-- e1:SetOperation(c3014.PendOperation)
	-- c:RegisterEffect(e1)
	-- local e1=Effect.CreateEffect(c)
	-- e1:SetType(EFFECT_TYPE_SINGLE)
	-- e1:SetCode(EFFECT_CANNOT_SSET)
	-- c:RegisterEffect(e1)	
end
function c3014.PendOperation(e,tp,eg,ep,ev,re,r,rp,c,sg,og)
	-- Duel.SkipPhase(tp,PHASE_MAIN2,RESET_PHASE+PHASE_END,1)
	-- local e1=Effect.CreateEffect(e:GetHandler())
		-- e1:SetType(EFFECT_TYPE_FIELD)
		-- e1:SetCode(EFFECT_BP_TWICE)
		-- e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
		-- e1:SetTargetRange(1,0)
		-- Duel.RegisterEffect(e1,tp)
		Duel.SelectYesNo(0,aux.Stringid(100000291,0))		
		local g=Duel.SelectMatchingCard(tp,nil,tp,0xff,0xff,1,1,e:GetHandler())
		local c=Duel.AnnounceCard(tp)
		g:GetFirst():SetEntityCode(c)
		g:GetFirst():ReplaceEffect(c,0)
end
function c3014.splimit(e,c,sump,sumtype,sumpos,targetp,se)
	return bit.band(sumpos,bit.bnot(POS_FACEUP))==0
end
function c3014.splimit2(e,c,sump,sumtype,sumpos,targetp,se)
	return bit.band(sumpos,bit.bnot(POS_FACEDOWN))==0
end
function c3014.activate(e,tp,eg,ep,ev,re,r,rp)
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_OATH)
	e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	e1:SetTargetRange(1,1)
	e1:SetTarget(c3014.splimit)
	e1:SetReset(RESET_PHASE+PHASE_END)
	e1:SetValue(POS_FACEUP)
	Duel.RegisterEffect(e1,tp)
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_OATH)
	e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	e1:SetTargetRange(1,1)
	e1:SetTarget(c3014.splimit2)
	e1:SetValue(POS_FACEDOWN)
	Duel.RegisterEffect(e1,tp)
end


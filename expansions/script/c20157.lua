require "expansions/script/nef/dss"
--侦符「探索人形」
function c20157.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c20157.target)
	e1:SetOperation(c20157.activate)
	c:RegisterEffect(e1)
end
function c20157.cfilter(c)
	return c:IsSetCard(0x186) and c:IsFaceup()
end
function c20157.filter(c)
	return c:IsSetCard(0x186) and c:IsAbleToHand() and c:IsType(TYPE_MONSTER)
end
function c20157.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c20157.filter,tp,LOCATION_DECK,0,1,nil)
		and Duel.IsExistingMatchingCard(c20157.cfilter,tp,LOCATION_MZONE,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function c20157.activate(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,c20157.filter,tp,LOCATION_DECK,0,1,1,nil)
	if g:GetCount()>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end

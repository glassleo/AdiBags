local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")
local animaFilter = AdiBags:RegisterFilter("Anima", 94)
animaFilter.uiName = "Anima";
animaFilter.uiDesc = "Puts Anima Items in their own section."

function animaFilter:Filter(slotData)
	local itemLink = C_Container.GetContainerItemLink(slotData.bag, slotData.slot)
	if (itemLink) then
		local isAnima = C_Item.IsAnimaItemByID(itemLink);
		if (isAnima) then
			local covenant = C_Covenants and C_Covenants.GetActiveCovenantID() or 0

			if covenant == 1 then
				return "9199. Anima", "Sanctum"
			elseif covenant == 2 then
				return "9199. Anima", "Sanctum"
			elseif covenant == 3 then
				return "9199. Anima", "Sanctum"
			elseif covenant == 4 then
				return "9199. Anima", "Sanctum"
			else
				return "9199. Anima", "Sanctum"
			end
		end
	end
	return
end
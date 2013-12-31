local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" then
		local addon = ...
		if addon:lower() ~= "stayfocused_combopoints" then return end
		StayFocused:AddHandler('Combo Points', function(power, max_power, elapsed)
			local text = StayFocused.value:GetText()
			local cpoints = GetComboPoints(UnitHasVehicleUI("player") and "vehicle" or "player", "target")
			if cpoints == 0 then return end
			if text == '' then
				StayFocused.value:SetText(cpoints)
			else
				StayFocused.value:SetText(text .. ' (' .. cpoints .. ')')
			end
		end)
	end
end)

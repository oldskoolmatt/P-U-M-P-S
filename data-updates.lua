--------------------------
---- data-updates.lua ----
--------------------------

-- Assign reskin icon tiers
if mods ["reskins-bobs"] then

	local assign_tier = require ("utils.lib").assign_tier
	if not (reskins.bobs and reskins.bobs.triggers.logistics.entities or reskins.bobs and reskins.bobs.triggers.plates.entities) then return end

	assign_tier("offshore-pump-1", 1)
	assign_tier("offshore-pump-2", 2)
	assign_tier("offshore-pump-3", 3)
	assign_tier("offshore-pump-4", 4)
end
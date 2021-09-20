--------------------------
---- data-updates.lua ----
--------------------------

-- Remove bob's  (redundant) water miners
if mods ["angelsrefining"] then

	if settings.startup["bobmods-mining-waterminers"].value == true then
		require("prototypes.override.bob-water-miner-techs")
	end

	local OSM_mod = OSM.mod.PUMPS
		
	local nuke_list =
	{
		["water-miner-1"] = "pumpjack",
		["water-miner-2"] = "bob-pumpjack-1",
		["water-miner-3"] = "bob-pumpjack-2",
		["water-miner-4"] = "bob-pumpjack-3",
		["water-miner-5"] = "bob-pumpjack-4"
	}

	OSM.lib.prototype.super_duper_proto_nuker(nuke_list, OSM_mod)
end
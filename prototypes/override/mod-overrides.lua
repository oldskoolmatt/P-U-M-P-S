--------------------------
---- data-updates.lua ----
--------------------------

-- Fetch functions from library
local hide_entity = require("utils.lib").hide_entity
local fix_collision_mask = require ("utils.lib").fix_collision_mask
local add_tech = require ("utils.lib").add_tech
local rem_tech = require ("utils.lib").rem_tech
local replace_tech_recipe = require ("utils.lib").replace_tech_recipe

-- Assign reskin icon tiers
if mods ["reskins-bobs"] then

	local assign_tier = require ("utils.lib").assign_tier
	if not (reskins.bobs and reskins.bobs.triggers.logistics.entities or reskins.bobs and reskins.bobs.triggers.plates.entities) then return end

	assign_tier("offshore-pump-1", 1)
	assign_tier("offshore-pump-2", 2)
	assign_tier("offshore-pump-3", 3)
	assign_tier("offshore-pump-4", 4)
end





-- AAI Industry offshore pump unlock fix
replace_tech_recipe("offshore-pump", "offshore-pump-1", "basic-fluid-handling")
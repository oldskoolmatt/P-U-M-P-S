------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Fetch functions from library
local hide_entity = require("utils.lib").hide_entity
local fix_collision_mask = require ("utils.lib").fix_collision_mask
local add_tech_recipe = require ("utils.lib").add_tech_recipe
local remove_tech_recipe = require ("utils.lib").remove_tech_recipe
local replace_tech_recipe = require ("utils.lib").replace_tech_recipe

-- Hide vanilla offshore pump
hide_entity("offshore-pump")

-- Prevent collision mask mismatch
fix_collision_mask("offshore-pump-0")
fix_collision_mask("offshore-pump-1")
fix_collision_mask("offshore-pump-2")
fix_collision_mask("offshore-pump-3")
fix_collision_mask("offshore-pump-4")

-- AAI Industry offshore pump unlock fix
if mods ["aai-industry"] then
	replace_tech_recipe("offshore-pump", "offshore-pump-1", "basic-fluid-handling")
	remove_tech_recipe("offshore-pump-1", "fluid-handling")
end
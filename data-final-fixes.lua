------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Fetch functions from library
local hide_entity = require("utils.lib").hide_entity
local fix_collision_mask = require ("utils.lib").fix_collision_mask
local add_tech = require ("utils.lib").add_tech
local rem_tech = require ("utils.lib").rem_tech
local replace_tech_recipe = require ("utils.lib").replace_tech_recipe

-- Hide vanilla offshore pump
hide_entity("offshore-pump")

-- Prevent collision mask mismatch
fix_collision_mask("offshore-pump-0")
fix_collision_mask("offshore-pump-1")
fix_collision_mask("offshore-pump-2")
fix_collision_mask("offshore-pump-3")
fix_collision_mask("offshore-pump-4")